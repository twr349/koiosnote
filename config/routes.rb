Rails.application.routes.draw do
  
  resources :subjects do
     resources :topics, except: [:index]
  end
  
  resources :topics do
     resources :notes, except: [:index]
  end

  devise_for :users

  root to: 'users#show'

end
