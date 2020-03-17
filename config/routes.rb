Rails.application.routes.draw do
  #Signup
  post '/api/v1/signup', to: 'api/v1/users#create'
  #Login
  post '/api/v1/login', to: 'api/v1/sessions#create'
  #Logout
  delete '/api/v1/logout', to: 'api/v1/sessions#destroy'
  #Set Current User
  get '/api/v1/get_current_user', to: 'api/v1/sessions#get_current_user'


  namespace :api do
    namespace :v1 do
      resources :users
      # Changed this namespacing for now until I figure out how to handle users.
      resources :lists do
          resources :tasks
      end
    end
  end
end

#Routes are nested so users cannot view lists or tasks that do not belong to them.
#We don't want users to be able to view /lists or /tasks
#The controllers only show the index/show page for items with the associated id.
