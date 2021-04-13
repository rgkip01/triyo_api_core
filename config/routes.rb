Rails.application.routes.draw do
  
  post '/users/new', to: 'users#create'
  
  namespace :auth do 
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end

  namespace :company do 
    post '/customers/new', to: 'customers#create'
  end
end
