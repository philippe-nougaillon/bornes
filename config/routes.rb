Rails.application.routes.draw do
  resources :bornes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: 'json'} do 
    namespace :v1 do 
        resources :bornes
    end 
    # namespace :v2 do 
    #     resources :bornes
    # end 
  end 

  root 'bornes#index'
end
