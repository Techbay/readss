Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :lists
    resources :videos
    resources :api_requests

    root to: "users#index"
  end

  namespace :apis do
    namespace :v1 do
      post 'add_reward', to: 'users#add_reward'
    end
  end

  devise_for :users
  resources :videos
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
