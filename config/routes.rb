Rails.application.routes.draw do
 resources :labels, only: [:show]

 resources :topics do
   resources :posts, except: [:index]
 end
 
 resources :posts, only: [] do
  resources :comments, only: [:create, :destroy]
   end
  
  get 'about' => 'welcome#about'
 resources :users, only: [:new, :create]
 resources :sessions, only: [:new, :create, :destroy]

  root 'welcome#index'
end
