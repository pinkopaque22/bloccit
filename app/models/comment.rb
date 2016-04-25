class Comment < ActiveRecord::Base
<<<<<<< Updated upstream
  belongs_to :post
=======
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  #has_many :commentable, foreign_key: :commentable_id, dependent: :destroy

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
  default_scope { order('updated_at DESC') }
  
   after_create :send_favorite_emails
 
   private
 
   def send_favorite_emails
     commentable.favorite.each do |favorite|
       FavoriteMailer.new_comment(user, post, comment).deliver_now
     end
   end
>>>>>>> Stashed changes
end
