Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'user_details', to: 'users/registrations#new_user_detail'
    post 'user_details', to: 'users/registrations#create_user_detail'
  end
  root 'videos#index'
  resources :videos, only: [:show, :new, :create, :destroy] do
    collection do 
      get 'search'
    end
    resources :mylists, only: [:create, :edit, :destroy] do
      member  do
        post    'add'
      end
    end
  end
  resources :users, only:  [:show] do
    resources :mylists, only: [:index,:show] do
      member do
        delete  'mylist_destroy'
      end
    end
  end
end
