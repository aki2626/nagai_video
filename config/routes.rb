Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'user_details', to: 'users/registrations#new_user_detail'
    post 'user_details', to: 'users/registrations#create_user_detail'
  end
  root 'videos#index'
  resources :videos, only: [:show, :new, :create] do
    collection do 
      get 'search'
    end
  end
  resources :users, only:  [:show] do
    resources :mylists, only: [:create, :edit]
  end
end
