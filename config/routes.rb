require 'sidekiq/web'

Rails.application.routes.draw do
  root 'pages#index'
  
  mount Sidekiq::Web => '/sidekiq'
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :rates, only: [:index]
    end
  end
  namespace :admin do
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resources :rates, only: [:index, :update]
      end
    end
  end

  match '*path', to: 'pages#index', via: :all
end
