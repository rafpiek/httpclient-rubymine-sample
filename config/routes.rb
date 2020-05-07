Rails.application.routes.draw do
  root to: 'application#home'

  post '/login', to: 'application#login'
  get '/all', to: 'application#all_data'

  resources :users do
    member do
      resources :cars
      resources :books
    end
  end
end
