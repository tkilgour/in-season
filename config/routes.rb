Rails.application.routes.draw do

  root to: 'farms#index'

  resources :farms, only: [:show, :index] do
    resources :crops, only: [:index]
  end

  resources :crops, except: [:index, :edit, :new] do
    get :autocomplete_stock_crop_name, :on => :collection
  end

end
