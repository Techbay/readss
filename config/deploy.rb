# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'readss'
set :repo_url, 'git@github.com:Techbay/readss.git'

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :deploy_user, 'deploy'
set :keep_releases, 5
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/feedmob"

set :scm, :git
set :bundle_without,  %w{development test}.join(' ')
set :linked_files, fetch(:linked_files, []).push('config/application.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'public/template', 'public/template_js')

set :use_sudo, false
set :rails_env, 'production'
set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }
set :depoly_via, :remote_cache
set :backup_path, "/home/#{fetch(:deploy_user)}/Backup"
set :conditionally_migrate, true

# for unicorn
# set :unicorn_config_path, -> { File.join(current_path, "config", "unicorn.rb") }

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
        execute :bundle, "exec unicorn_rails", "-c", fetch(:unicorn_config_path), "-E production -D"
      end
    end
  end

  desc "Stop Application"
  task :stop do
    on roles(:web), in: :sequence, wait: 5 do
      execute "kill -QUIT `cat #{shared_path}/tmp/pids/unicorn.#{fetch(:application)}.pid`"
    end
  end

  desc "Restart Application"
  task :restart do
    on roles(:web), in: :sequence, wait: 10 do
      execute "kill -USR2 `cat #{shared_path}/tmp/pids/unicorn.#{fetch(:application)}.pid`"
    end
  end

  desc "Start or Restart Application"
  task :start_or_restart do
    on roles(:web), in: :sequence, wait: 10 do
      if test "[ -f #{shared_path}/tmp/pids/unicorn.#{fetch(:application)}.pid ]"
        execute "kill -USR2 `cat #{shared_path}/tmp/pids/unicorn.#{fetch(:application)}.pid`"
      else
        within current_path do
          execute :bundle, "exec unicorn_rails", "-c", fetch(:unicorn_config_path), "-E production -D"
        end
      end
      execute "rm -rf tmp/cache"
    end
  end

  desc 'Restart the delayed_job process on db server for upload images'
  task :restart_delayed_job_for_images do
    on roles(:db), in: :sequence, wait: 15 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', '--queue=images', '-n 1', :restart
        end
      end
    end
  end
  after :publishing, :restart_delayed_job_for_images

  #https://github.com/collectiveidea/delayed_job/wiki/Delayed-Job-tasks-for-Capistrano-3#if-you-dont-want-to-use-a-gem
  desc 'Restart the delayed_job process on worker server(1)'
  task :restart_delayed_job_for_worker do
    on roles(:worker), in: :sequence, wait: 15 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', '--queue=crawler', '-n 2', :restart
          execute :bundle, :exec, :'bin/delayed_job', '--queue=default', '-n 1', :restart
        end
      end
    end
  end
  after :publishing, :restart_delayed_job_for_worker

  desc 'Restart the delayed_job process on job server(5)'
  task :restart_delayed_job_for_job do
    on roles(:job), in: :sequence, wait: 15 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', '--queue=crawler', '-n 3', :restart
        end
      end
    end
  end

  desc 'Restart the delayed_job process on job server(2, 3)'
  task :restart_delayed_job_for_excluding do
    on roles(:excluding), in: :sequence, wait: 15 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', '--queue=excluding', '-n 2', :restart
        end
      end
    end
  end

  desc 'Restart the delayed_job process on job server(4, 6, 7, 8)'
  task :restart_delayed_job_for_sources do
    on roles(:sources), in: :sequence, wait: 15 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', '--queue=sources', '-n 1', :restart
        end
      end
    end
  end

  desc 'Stop all delayed job processes on job server'
  task :stop_all_job_processes do
    on roles(:sources), in: :sequence, wait: 15 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', :stop
        end
      end
    end
    # on roles(:worker), in: :sequence, wait: 15 do
    #   within release_path do
    #     with rails_env: fetch(:rails_env) do
    #       execute :bundle, :exec, :'bin/delayed_job', :stop
    #     end
    #   end
    # end
    # on roles(:web), in: :sequence, wait: 15 do
    #   within release_path do
    #     with rails_env: fetch(:rails_env) do
    #       execute :bundle, :exec, :'bin/delayed_job', :stop
    #     end
    #   end
    # end
    # on roles(:job), in: :sequence, wait: 15 do
    #   within release_path do
    #     with rails_env: fetch(:rails_env) do
    #       execute :bundle, :exec, :'bin/delayed_job', :stop
    #     end
    #   end
    # end
  end

  after :publishing, :start_or_restart
  after :finishing, :cleanup
end
