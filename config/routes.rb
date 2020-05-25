Rails.application.routes.draw do
  devise_for :users
  
  root "products#index"
  resources :products,      only: [:new, :show] do
    resources :purchases,     only: [:index] do
      collection do
        get 'index', to: 'purchases#index'
        post 'pay', to: 'purchases#pay'
        get 'done', to: 'purchases#done'
      end
    end
  end
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
  resources :card,          only: [:new, :show, :destroy] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
