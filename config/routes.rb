require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root "home#index"

  resources :roboscout_queries, only: [:index, :create, :show] do
    member do
      get :people
    end
  end

  get '*path', to: 'home#index', via: :all
end
