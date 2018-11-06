Rails.application.routes.draw do
  resources :bornes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'bornes#index'
end
