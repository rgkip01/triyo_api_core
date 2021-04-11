Rails.application.routes.draw do
  post '/users/new', to: 'users#create'

  namespace :auth do 
    post '/login', to: 'sessions#create'
  end
end
