class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
  default_scope { order('updated_at DESC') }

end
