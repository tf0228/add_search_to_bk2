Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :followings, :followers
    end
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end