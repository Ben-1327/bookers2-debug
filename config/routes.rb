Rails.application.routes.draw do
  resources :books do
    resource :book_comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index] do
  	resource :relationships, only: [:create, :destroy]
  	get 'follows' => 'relationships#followed', as: 'follows'
  	get 'followers' => 'relationships#follower', as: 'followers'
  end
  root 'homes#top'
  get 'home/about' => 'homes#about'
end
