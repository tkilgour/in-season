Rails.application.routes.draw do

  root to: 'farms#index'

  resources :farms, only: [:show, :index, :update, :edit, :create, :new] do
    post :update_avatar
    post :update_banner
    resources :crops, only: [:index]
  end

  resources :crops, except: [:index, :edit, :new] do
    get :autocomplete_stock_crop_name, :on => :collection
  end

  resources :markets, except: [:destroy, :edit, :new] do
    get :autocomplete_market_name, :on => :collection
  end

  post '/markets/:id/delete' => 'markets#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/member_registration' => 'users#new_member'
  get '/farmer_registration' => 'users#new_farmer'
  post '/users' => 'users#create'

end
