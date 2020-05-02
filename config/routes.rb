Rails.application.routes.draw do
  resources :books
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  root 'homes#top'
  get 'homes/about'
end
