Rails.application.routes.draw do
  
  
  
  resources :subjects do
    resources :topics, except: [:index]  
  end

  devise_for :users

  root to: 'subjects#index'

end
