class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]
 
   def create
     if params[:post_id]
       @commentable = Post.find(params[:post_id])
     else
       @commentable = Topic.find(params[:topic_id])
     end
     comment = @commentable.comments.new(comment_params)
     comment.user = current_user
   
     if comment.save
       flash[:notice] = "Comment saved successfully."
     else
       flash[:alert] = "Comment failed to save."
     end
     if @commentable.is_a? Post
       redirect_to [@commentable.topic, @commentable]
     else
       redirect_to @commentable
     end
   end
   
   def destroy
     @comment = Comment.find(params[:id])
     commentable = @comment.commentable
     if @comment.destroy
       flash[:notice] = "Comment was deleted."
        #redirect_to  [(@comment.commentable.is_a? Post ? @comment.commentable.topic : nil), @comment.commentable]
     else
       flash[:alert] = "Comment couldn't be deleted. Try again."
     end
     if commentable.is_a? Post
      redirect_to [commentable.topic, commentable]
     else
      redirect_to commentable
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
