Rails.application.routes.draw do

  root to: 'farms#index'

  resources :farms, only: [:show, :index]

  resources :products, only: [:show]
end
