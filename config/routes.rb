Rails.application.routes.draw do

  root to: 'farms#index'

  resources :farms, only: [:show, :index, :update, :edit, :create, :new] do
    post :update_avatar
    post :update_banner
    post :add_market
    delete :remove_market
    resources :crops, only: [:index]
    resources :boxes, only: [:index, :show]
    resources :orders, only: [:create, :show]
    resource :cart, only: [:show] do
      put    :add_item
      delete :remove_item
    end
  end

  resources :crops, except: [:index, :edit, :new] do
    get :autocomplete_stock_crop_name, :on => :collection
  end

  resources :markets, except: [:destroy, :edit, :new] do
    get :autocomplete_market_name, :on => :collection
  end

  resources :users, only: [:show] do
    resources :orders, only: [:show, :index]
  end

  get '/search' => 'farms#search'
  post '/crops/search' => 'crops#search'
  post '/crops/search_name' => 'crops#crop_by_name'
  post '/markets/search' => 'markets#search'
  post '/markets/search_name' => 'markets#market_by_name'
  post '/current_location' => 'farms#current_location'

  post '/markets/:id/delete' => 'markets#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/member_registration' => 'users#new_member'
  get '/farmer_registration' => 'users#new_farmer'
  post '/users' => 'users#create'

end
