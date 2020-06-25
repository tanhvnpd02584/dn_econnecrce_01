Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/login", to: "sessions#new", as: "login"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :products, only: %i(show index)
    post "carts/:id/add", to: "carts#add_item", as: "cart_add_item"
    post "carts/:id/sub", to: "carts#sub_item", as: "cart_sub_item"
    delete "carts/remove_from_cart/:id", to: "carts#remove_from_cart", as: "remove_from_cart"
    get "carts", to: "carts#index", as: "carts"
    namespace :admin do
      root "products#index"
      resources :products, except: %i(show destroy)
    end
  end
end
