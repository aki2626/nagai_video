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
      get 'ranking_index'
      get 'latest_index'
    end
    member do
      get 'genre'
      get 'tag'
    end
    resources :mylists, only: [:create, :edit, :destroy] do
      member  do
        post    'add'
      end
    end
    resources :comments, only: [:index, :create] 
  end
  resources :users, only:  [:show,:edit,:update] do
    member  do
      get     'edit_user_detail'
      patch   'update_user_detail'
    end
    resources :mylists, only: [:index,:show] do
      member do
        delete  'mylist_destroy'
      end
    end
  end
end
