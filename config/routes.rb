Rails.application.routes.draw do

  root to: 'farms#index'

  resources :farms, only: [:show, :index]

  resources :crops, only: [:show]
end
