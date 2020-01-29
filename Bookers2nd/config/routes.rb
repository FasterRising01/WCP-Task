Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :books
  resources :users
  resources :home, only: [:index]
  get "home/about" => "home#about"
end
