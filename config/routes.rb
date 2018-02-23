Rails.application.routes.draw do
  
  resources :subjects do
     resources :topics, except: [:index]
  end
  
  resources :topics do
     resources :notes, except: [:index]
  end

  devise_for :users  
  

  get '/views/users/review.html.erb', to: 'users#review', as: "review"
  patch '/mark_reviewed/:id', to: 'notes#mark_reviewed', as: "mark_reviewed"
  
  root to: 'users#show'

end
