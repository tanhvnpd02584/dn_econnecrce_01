Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/login", to: "sessions#new", as: "login"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :products, only: %i(show index)
    post "carts/:id/add", to: "carts#add_item", as: "cart_add_item"
    get "carts", to: "carts#index", as: "carts"
    namespace :admin do
      root "products#index"
      resources :products, except: %i(show destroy)
    end
  end
end
