Rails.application.routes.draw do
  
  resources :subjects do
     resources :topics, except: [:index]
  end
  
  resources :topics do
     resources :notes, except: [:index]
  end

  devise_for :users  
    
  get '/views/users/review.html.erb', to: 'users#review', as: "review"
  post '/views/users/review.html.erb', to: 'users#review'
  
  root to: 'users#show'

end
