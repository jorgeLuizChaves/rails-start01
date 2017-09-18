Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:new, :edit, :destroy, :create]

  get "/product/search" => "products#search", as: :search_product
  root 'products#index'
end
