Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users
    resources :lists
    resources :videos
    resources :api_requests

    root to: "users#index"
  end

  namespace :apis do
    namespace :v1 do
      get 'add_reward', to: 'users#add_reward'
    end
  end

  resources :videos
  root to: 'videos#index'
  get 'user_id', to: 'application#user_id'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
