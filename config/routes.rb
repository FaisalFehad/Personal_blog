Rails.application.routes.draw do
  get 'followers/:id/unfollow', to: 'followers#destroy', as: 'unfollow'
  devise_for :users
  root 'articles#index'
  resources :followers, only: [:new, :create, :destroy]
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
end
