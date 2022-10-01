Rails.application.routes.draw do
  root to: "home#index"
  get 'home/index'
  get 'product_creators/index'
  get 'product_creators/show'
  get 'products/index'
  get 'products/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index, :show]
  resources :product_creators, only: [:index, :show]

  #root to: "home#index"
end
