class SponsoredPostsController < ApplicationController
  
  def show
     @sponsored_post = SponsoredPost.find(params[:id])
  end
  
  def new
     @sponsored_post = SponsoredPost.new
     @sponsored_post.topic = Topic.find(params[:topic_id])
  end

  def edit
     @sponsored_post = SponsoredPost.find(params[:id])
  end
  
  def update
     @sponsored_post = SponsoredPost.find(params[:id])
 
     @sponsored_post.title = params[:sponsored_post][:title]
     @sponsored_post.body = params[:sponsored_post][:body]
     @sponsored_post.price = params[:sponsored_post][:price]

     if @sponsored_post.save
        flash[:notice] = "Sponsored Post was updated."
        redirect_to @sponsored_post.topic, notice: "Sponsored Post was saved."
       
     else
       flash.now[:alert] = "Error saving Sponsored Post. Please try again."
       render :edit
     end
  end
  def create
     @sponsored_post = SponsoredPost.new
     @sponsored_post.title = params[:sponsored_post][:title]
     @sponsored_post.body = params[:sponsored_post][:body]
     @sponsored_post.price = params[:sponsored_post][:price]
     @sponsored_post.topic = Topic.find(params[:topic_id])
 
     if @sponsored_post.save
       redirect_to @sponsored_post.topic, notice: "Sponsored Post was created successfully."
     else
       flash.now[:alert] = "Error creating Sponsored Post. Please try again."
       render :new
     end
  end
  
  def destroy
     @sponsored_post.topic = Topic.find(params[:topic_id][sponsored_post])
 
     if @sponsored_post.destroy
       flash[:notice] = "\"#{@sponsored_post.title}\" was deleted successfully."
       redirect_to @sponsored_post.topic

       #redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the Sponsored Post."
       render :show
     end
    
  end
end
  



