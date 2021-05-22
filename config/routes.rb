Rails.application.routes.draw do
  post '/users/new', to: 'users#create'
  
  namespace :auth do 
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
  
  namespace :company do 
    post '/customers/new', to: 'customers#create'
    get '/customers/list', to: 'customers#index'
    get '/customers/:id/details', to: 'customers#details'
    put '/customers/:id/update', to: 'customers#update'
    delete '/customers/:id/delete', to: 'customers#destroy'
  end

  namespace :customers do
    post '/orders/new', to: 'order_of_services#create'
  end
end
