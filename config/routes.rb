Rails.application.routes.draw do
  get 'countries/index'
  get 'countries/show'
  get 'categories/index'
  get 'categories/show'
  #resources :pages

  root to: "home#index"
  get 'home/index'
  get 'product_creators/index'
  get 'product_creators/show'
  get 'products/index'
  get 'products/show'
  get '/pages/:permalink' => "pages#permalink", as: 'permalink'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index, :show] do
    collection do
      get get "search"
    end
  end

  resources :product_creators, only: [:index, :show]
  resources :pages, except: [:show]
  resources :categories, only: [:index, :show]
  resources :countries, only: [:index, :show]
  #root to: "home#index"
end
