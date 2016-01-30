Rails.application.routes.draw do
 resources :topics do
   resources :posts, except: [:index]
 end

  get 'about' => 'welcome#about'
 resources :users, only: [:new, :create]

  root 'welcome#index'
end
