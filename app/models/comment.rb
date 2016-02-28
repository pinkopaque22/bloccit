class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :topics
  belongs_to :user
  
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
