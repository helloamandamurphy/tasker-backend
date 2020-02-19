Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :lists do
          resources :tasks
        end
      end
    end
  end
end

#Routes are nested so users cannot view lists or tasks that do not belong to them.
#We don't want users to be able to view /lists or /tasks
#The controllers only show the index/show page for items with the associated id.
