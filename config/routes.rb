Rails.application.routes.draw do
  devise_for :users
  
  root "products#index"
  resources :products,      only: [:show, :new, :create, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :purchases,     only: [:index]
  resources :mypage,        only: [:index, :new, :show]
  resources :users,         only: [:index]
end
