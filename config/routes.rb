Rails.application.routes.draw do
  resources :homes
  resources :images
  resources :reviews
  resources :reservations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
