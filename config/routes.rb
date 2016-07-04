Rails.application.routes.draw do
  get 'followers/:id/unfollow', to: 'followers#destroy', as: 'unfollow'

  devise_for :users
  root 'articles#index'
  resources :followers
  resources :articles do
    resources :comments
  end
end
