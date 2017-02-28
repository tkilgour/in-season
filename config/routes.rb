Rails.application.routes.draw do

  root to: 'farms#index'

  resources :farms, only: [:show, :index, :create, :update] do
    resources :crops, only: [:index]
  end

  resources :crops, except: [:index, :edit, :new] do
    get :autocomplete_stock_crop_name, :on => :collection
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/member_registration' => 'users#new_member'
  get '/farmer_registration' => 'users#new_farmer'
  post '/users' => 'users#create_member'
  post '/users' => 'users#create_farmer'


end
