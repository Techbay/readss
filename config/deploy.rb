# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'readss'
set :repo_url, 'https://github.com/Techbay/readss.git'

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :deploy_user, 'deploy'
set :keep_releases, 5
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/readss"

set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }
set :rbenv_type, :deploy # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.3.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

set :scm, :git
set :bundle_without,  %w{development test}.join(' ')

set :linked_files, fetch(:linked_files, []).push('config/application.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'public/template', 'public/template_js')

set :use_sudo, false
set :rails_env, 'production'
set :depoly_via, :remote_cache
set :backup_path, "/home/#{fetch(:deploy_user)}/Backup"
set :conditionally_migrate, true

# for unicorn
# set :unicorn_config_path, -> { File.join(current_path, "config", "unicorn.rb") }

# for nginx
set :nginx_sites_available_path, "/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled"
set :puma_nginx, :web


# for puma
set :puma_init_active_record, false
set :puma_bind, "unix://tmp/sockets/puma.sock"
set :puma_role, :web
set :puma_conf, "#{shared_path}/config/puma.rb"

# for assets
set :keep_assets, 2

# for whenever
set :whenever_command, [:bundle, :exec, :whenever]
set :whenever_roles, ->{ [:db] }
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

namespace :deploy do
  desc "Init the config files in shared_path"
  task :setup_config do
    on roles(:all), in: :sequence, wait: 5 do
      unless test "[ -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
        upload!("config/application.example.yml", "#{shared_path}/config/application.yml")
        puts "Now edit the config files in #{shared_path}"
      end
    end
  end
  after "check:directories", :setup_config

  # for unicorn operate
  desc "Start Application"
  task :start do
    on roles(:web), in: :sequence, wait: 5 do
      within current_path do
        execute :bundle, "exec puma:start"
      end
    end
  end

  desc "Stop Application"
  task :stop do
    on roles(:web), in: :sequence, wait: 5 do
      execute :bundle, "exec puma:stop"
      # execute "kill -QUIT `cat #{shared_path}/tmp/pids/puma.pid`"
    end
  end

  desc "Restart Application"
  task :restart do
    on roles(:web), in: :sequence, wait: 10 do
      execute :bundle, "exec puma:restart"
      # execute "kill -USR2 `cat #{shared_path}/tmp/pids/puma.pid`"
    end
  end

  desc "Start or Restart Application"
  task :start_or_restart do
    on roles(:web), in: :sequence, wait: 10 do
      if test "[ -f #{shared_path}/tmp/pids/puma.pid ]"
        execute "kill -USR2 `cat #{shared_path}/tmp/pids/puma.pid`"
      else
        within current_path do
          execute :bundle, "exec puma:start"
        end
      end
      execute "rm -rf tmp/cache"
    end
  end

  desc 'Restart the delayed_job process on db server for upload images'
  task :restart_fetching_videos_job do
    on roles(:db), in: :sequence, wait: 15 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', '--queue=videos', '-n 1', :restart
        end
      end
    end
  end
  after :publishing, :"puma:start"
  after :publishing, :restart_fetching_videos_job
  after :finishing, :cleanup
end
