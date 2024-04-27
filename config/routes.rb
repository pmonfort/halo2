Rails.application.routes.draw do
  root "home#index"

  resources :roboscout_queries, only: [:index, :create] do
    member do
      get :status
    end
  end

  get '*path', to: 'home#index', via: :all
end
