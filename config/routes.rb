Rails.application.routes.draw do
  
  
  
  resources :subjects do
    resources :topics  
  end

  devise_for :users

  root to: 'user#show'

end
