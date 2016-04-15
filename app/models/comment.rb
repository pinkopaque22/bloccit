class Comment < ActiveRecord::Base
  belongs_to :user
  #belongs_to :post, foreign_key: :commentable_id
  belongs_to :commentable, foreign_key: :commentable_id, polymorphic: true


  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
  default_scope { order('updated_at DESC') }
  
  after_create :send_favorite_emails
 
  private
 
   def send_favorite_emails
     if commentable.is_a? Post
        commentable.favorites.each do |favorite|
         FavoriteMailer.new_comment(favorite.user, post, self).deliver_now
        end
     end
   end
end
