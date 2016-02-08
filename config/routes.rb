Rails.application.routes.draw do
 resources :topics do
   resources :posts, except: [:index]
 end

 resources :users, only: [:new, :create]
 post 'users/confirm' => 'users#confirm'
 get 'about' => 'welcome#about'

 root to: 'welcome#index'
end





#The route should be a POST to 'users/confirm' and point to users#confirm.