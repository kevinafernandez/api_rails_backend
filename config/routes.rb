Rails.application.routes.draw do
 
  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :api, constraints: { format: 'json' } do 
    namespace :v1 do
      resources :users
      resources :sections
      resources :articles
    end
  end 
  
end
