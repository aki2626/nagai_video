Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'videos#index'
  resources :videos, only: [:show, :new, :create] do
    collection do 
      get 'search'
    end
  end
end
