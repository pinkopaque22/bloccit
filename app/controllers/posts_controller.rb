class PostsController < ApplicationController
  #comment this method out when nesting to have topics redirect to show, not index
  def index
    @posts = Post.all
  end
  before_action :require_sign_in, except: :show
  def show
    @post = Post.find(params[:id])
  end
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end
  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @topic = Topic.find(params[:topic_id])
    @post.topic = @topic
    @post.user = current_user
    if @post.save
       flash[:notice] = "Your post was saved."
       redirect_to [@topic, @post]
    else
        #logger.info "THERE WAS AN ERROR@@@@@@@@@"
        #logger.info @post.inspect
       flash.now[:alert] = "There was an error saving your post. Please try again."
       render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
     @post = Post.find(params[:id])
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]
 
     if @post.save
        flash[:notice] = "Post was updated."
        redirect_to [@post.topic, @post]
     else
        flash.now[:alert] = "There was an error saving the post. Please try again."
        logger.info "THERE WAS AN ERROR@@@@@@@@@"
        logger.info @post.inspect
        render :edit
     end
  end
  def destroy
     @post = Post.find(params[:id])
     if @post.destroy
        flash[:notice] = "\"#{@post.title}\" was deleted successfully."
        redirect_to @post.topic
     else
        flash.now[:alert] = "There was an error deleting the post."
        render :show
     end
  end
end
