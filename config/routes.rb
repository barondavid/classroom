Rails.application.routes.draw do
  devise_for :users
  
  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :users, only: [:create, :update, :show]
      resources :sessions, only: [:create, :destroy, :show]
      get '/relogin', to: 'sessions#relogin'
      post '/reset_password', to: 'users#reset_password'
    end
  end
end
