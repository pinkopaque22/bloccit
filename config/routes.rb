Rails.application.routes.draw do
 resources :labels, only: [:show]

 resources :topics do
   resources :posts, except: [:index]
   resources :comments, only: [:create, :destroy]
 end
 
 resources :posts, only: [] do
   resources :comments, only: [:create, :destroy]
   resources :favorites, only:[:create, :destroy]
   post '/up-vote' => 'votes#up_vote', as: :up_vote
   post '/down-vote' => 'votes#down_vote', as: :down_vote
 end
  
  get 'about' => 'welcome#about'
 resources :users, only: [:new, :create]
 resources :sessions, only: [:new, :create, :destroy]

  root 'welcome#index'
end
