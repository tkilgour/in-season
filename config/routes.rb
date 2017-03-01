Rails.application.routes.draw do

  root to: 'farms#index'

  resources :farms, only: [:show, :index] do
    resources :crops, only: [:index]
  end

  resources :crops, except: [:index, :edit, :new] do
    get :autocomplete_stock_crop_name, :on => :collection
  end

  resources :markets, except: [:destroy, :edit, :new] do
    get :autocomplete_market_name, :on => :collection
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/register' => 'users#new'
  post '/users' => 'users#create'

end
