Rails.application.routes.draw do
  get 'countries/index'
  get 'countries/show'
  get 'categories/index'
  get 'categories/show'
  #resources :pages

  root to: "home#index"
  get 'home/index'
  get 'home/about'
  get 'product_creators/index'
  get 'product_creators/show'
  get 'products/index'
  get 'products/show'
  get '/pages/:permalink' => "pages#permalink", as: 'permalink'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index, :show] do
    get '/page/:page', action: :index, on: :collection
    collection do
      get get "search"
    end
  end

  resources :product_creators, only: [:index, :show] do
    get '/page/:page', action: :index, on: :collection
  end

  resources :pages, except: [:show]
  resources :categories, only: [:index, :show] do
    get '/page/:page', action: :index, on: :collection
  end

  resources :countries, only: [:index, :show] do
    get '/page/:page', action: :index, on: :collection
  end
  #root to: "home#index"
end
