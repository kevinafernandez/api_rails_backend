Rails.application.routes.draw do

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :users
      resources :sections, only: %i[index show]
      resources :articles
    end
  end

end
