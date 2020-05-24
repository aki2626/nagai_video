Rails.application.routes.draw do
  root 'videos#index'
  resources :videos, only: [:show, :new, :create]
end
