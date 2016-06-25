Rails.application.routes.draw do
  scope "(/:locale)", locale: /en|zh-CN/ do
    devise_for :users

    namespace :admin do
      resources :users
      resources :lists
      resources :videos
      resources :api_requests
      resources :tags

      get '/:locale' => 'users#index'
      root to: "users#index"
    end

    namespace :apis do
      namespace :v1 do
        get 'add_reward', to: 'users#add_reward'
      end
    end

    resources :videos
    post 'video_redeem', to: 'videos#redeem'
    get 'user_id', to: 'application#user_id'
    get 'tag', to: 'videos#index'
    post 'tag_subscribe', to: 'tags#subscribe'

  end

  get '/:locale' => 'videos#index'
  root to: 'videos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
