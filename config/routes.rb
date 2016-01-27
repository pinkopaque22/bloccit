Rails.application.routes.draw do
  #get 'sponsored_post_controller/show'

  #get 'sponsored_post_controller/new'

  #get 'sponsored_post_controller/edit'

 resources :topics do
   resources :posts, except: [:index]
   resources :SponsoredPosts
 end

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
