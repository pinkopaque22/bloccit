class FavoritesController < ApplicationController
  before_action :require_sign_in
  def create
    post = Post.find(params[:post_id])
       favorite = current_user.favorites.build(post: post)
       if favorite.save
         flash[:notice] = "Post favorited."
       else
         flash[:alert] = "Favoriting failed." 
       end
       redirect_to [post.topic, post]
  end
  def destroy
    post = Post.find(params[:post_id])
       favorite = current_user.favorites.find(params[:id])
       if favorite.destroy
         flash[:notice] = "Your Post was unfavorited."
       else
         flash[:alert] = " Your Unfavoriting failed."
       end
      redirect_to [post.topic, post]
  end
end
