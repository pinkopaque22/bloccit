class SponsoredPostsController < ApplicationController
  def show
    @sponsored_post = SponsoredPosts.find(params[:id])
  end

  def new
    @sponsored_post = SponsoredPosts.new
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  


end
