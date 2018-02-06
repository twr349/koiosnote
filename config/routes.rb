Rails.application.routes.draw do
  
  resources :topics
  
  resources :subjects

  devise_for :users

  root to: 'user#show'

end
