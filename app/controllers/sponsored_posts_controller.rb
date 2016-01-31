class SponsoredPostsController < ApplicationController
  
  def show
     #@topic = Topic.find(params[:id])
     @sponsored_post = SponsoredPost.find(params[:id])
  end
  
  def new
    @sponsored_post = SponsoredPost.new
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  


end
