Rails.application.routes.draw do
  resources :books do
    resource :book_comments, only: [:create,:destroy]
  end
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update, :destroy,:create]
  root 'homes#top'
  get 'home/about' => 'homes#about'
end
