Rails.application.routes.draw do
  resources :posts  
  resources :profiles  
  root 'profiles#index'
end
