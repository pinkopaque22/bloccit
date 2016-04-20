class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]
  
  
   def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
   end
   
   def show
     @comment = Comment.find(params[:my_commentable_id])
   end
   
  def create
     @post = Post.find(params[:post_id])
     comment = @post.comments.new(comment_params)
     comment.user = current_user
     # @comment = @post.comments.new(comment_params)
     # @comment.user = current_user
     #@new_comment = Comment.new
     #if @comment.save
      if comment.save
      flash[:notice] = "Comment saved successfully."
       redirect_to [@post.topic, @post]
     else
      flash[:alert] = "Comment failed to save."
       redirect_to [@post.topic, @post]
      end
     # respond_to do |format|
     #  format.html
     #  format.js
      
     # end
  end

   def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
    # @comment = @post.comments.find(params[:my_commentable_id]
     if @comment.destroy
       flash[:notice] = "Comment was deleted."
       redirect_to [@post.topic, @post]
     else
       flash[:alert] = "Comment couldn't be deleted. Try again."
       redirect_to [@post.topic, @post]
     end
     # respond_to do |format|
     #   format.html
     #   format.js
       
     # end
   end
 
   private
 
   def comment_params
     params.require(:comment).permit(:body)
   end
   
   def authorize_user
     @comment = Comment.find(params[:my_commentable_id])
     unless current_user == comment.user || current_user.admin?
       flash[:alert] = "You do not have permission to delete a comment."
       redirect_to [comment.commentable.topic, comment.commentable]
     end
   end
   
end
