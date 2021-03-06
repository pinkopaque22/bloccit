class PostsController < ApplicationController
  #comment this method out when nesting to have topics redirect to show, not index
  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: [:show, :new, :create]
  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user
    if @post.save
       @post.labels = Label.update_labels(params[:post][:labels])
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
     @post.assign_attributes(post_params)
 
     if @post.save
        @post.labels = Label.update_labels(params[:post][:labels])
        flash[:notice] = "Post was updated."
        redirect_to [@post.topic, @post]
     else
        flash.now[:alert] = "There was an error saving the post. Please try again."
        #logger.info "THERE WAS AN ERROR@@@@@@@@@"
        #logger.info @post.inspect
        render :edit
     end
  end
  def destroy
     @post = Post.find(params[:id])
     if @post.destroy
        flash[:notice] = "\"#{@post.title}\" was deleted, buh BYE."
        redirect_to @post.topic
     else
        flash.now[:alert] = "was not deleted, try again."
        render :show
     end
  end
  private
   def post_params
     params.require(:post).permit(:title, :body)
   end
   def authorize_user
     post = Post.find(params[:id])
     unless current_user == post.user || current_user.admin?
       flash[:alert] = "Only Admins Can Perform That Task."
       redirect_to [post.topic, post]
     end
   end
end
