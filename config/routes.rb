Rails.application.routes.draw do
  devise_for :users
  
  root "products#index"
  resources :products
  resources :purchases, only: [:index]
  resources :signup, only: [:index]
  resources :purchases,     only: [:index]
  resources :mypage,        only: [:index, :new, :show]
  resources :users,         only: [:index]
end
