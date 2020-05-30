Rails.application.routes.draw do
  root 'videos#index'
  resources :videos, only: [:show, :new, :create] do
    collection do 
      get 'search'
    end
  end
end
