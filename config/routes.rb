Rails.application.routes.draw do
 resources :advertisements
 resources :posts


  get 'advertisement' => 'advertisement#about'

  root 'advertisement#index'
end
