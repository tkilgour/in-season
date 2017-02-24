Rails.application.routes.draw do

  root to: 'farms#index'

  resources :farms, only: [:show, :index] do
    resources :crops, only: [:index]
  end

  resources :crops, except: [:index, :edit, :new]
end
