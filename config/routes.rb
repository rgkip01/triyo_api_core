Rails.application.routes.draw do
  post '/users/new', to: 'users#create'
end
