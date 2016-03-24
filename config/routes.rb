Rails.application.routes.draw do
 resources :topics do
   resources :posts, except: [:index]
   
   get 'posts',  :to => 'posts#update', :as => :update
 end

  get 'about' => 'welcome#about'

 resources :users, only: [:new, :create, :edit, :update] 
 #resources :sessions, only: [:new, :create, :edit, :destroy, :update]
 
  root 'welcome#index'
end


