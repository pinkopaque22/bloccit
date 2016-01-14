Rails.application.routes.draw do
 resources :posts, only: :index

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
