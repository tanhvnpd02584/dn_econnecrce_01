Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/login", to: "sessions#new", as: "login"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :products, only: %i(show index)
    post "carts/:id/add", to: "carts#add_item", as: "cart_add_item"
    delete "carts/:id/delte", to: "carts#remove_from_cart", as: "remove_from_cart"
    get "carts", to: "carts#index", as: "carts"
    get "/purchases", to: "purchases#new"
    resources :purchases, only: %i(new create)
    namespace :admin do
      root "products#index"
      resources :products, only: :import do
        collection {post :import}
      end
      resources :products, except: %i(show destroy)
      resources :purchases, only: :index
    end
  end
end
