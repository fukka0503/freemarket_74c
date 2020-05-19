Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products,      only: [:new, :show]
  resources :purchases,     only: [:index]
  resources :signup,        only: [:index]
  resources :mypage,        only: [:index, :new, :show]
  resources :users,         only: [:index]
end
