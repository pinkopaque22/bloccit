class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]
 
   def create
     @post = Post.find(params[:post_id])
     @comment = @post.comments.new(comment_params)
     @comment.user = current_user
     @new_comment = Comment.new
     if @comment.save
       flash[:notice] = "Comment saved successfully."
       redirect_to [@post.topic, @post]
     else
       flash[:alert] = "Comment failed to save."
       redirect_to [@post.topic, @post]
     end
   end
   def show
     @comment = Comment.find(params[:id])
   end
   def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
     if @comment.destroy
       flash[:notice] = "Comment was deleted."
       redirect_to [@post.topic, @post]
     else
       flash[:alert] = "Comment couldn't be deleted. Try again."
       redirect_to [@post.topic, @post]
     end
   end
 private
 
   def comment_params
     params.require(:comment).permit(:body)
   end
   def authorize_user
     @comment = Comment.find(params[:id])
     unless current_user == @comment.user || current_user.admin?
       flash[:alert] = "You do not have permission to delete a comment."
       if params[:post_id]
         @commentable = Post.find(params[:post_id])
           redirect_to [@commentable.topic, @commentable]
       else
         @commentable = Topic.find(params[:topic_id])
           redirect_to @commentable
       end
     end
   end
end
