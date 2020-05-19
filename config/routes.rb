Rails.application.routes.draw do
  root to: 'videos#index'
  resources :videos, only: show
end
