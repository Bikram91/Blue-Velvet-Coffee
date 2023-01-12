Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # post "api/test", to: "application#test"

  namespace :api, defaults: { format: :json } do
    resources :users, only: :create
    resource :session, only: [:show, :create, :destroy]
    # resources :products, only: [:index, :show]
    resources :products, only: [:index, :show] do
      resources :reviews, only: [:index]
    end
    get '/products/:product_name', to: 'products#show'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    get '/products/search/:query', to: 'products#search'
    resources :reviews, only: [:create, :update, :destroy]
  end

  get '*path', to: "static_pages#frontend"
end
