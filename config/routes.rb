Rails.application.routes.draw do

 resources :topics do
   resources :posts #, except: [:sponsored_posts]
   resources :sponsored_posts #, except: [:sponsored_posts]
 end

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
