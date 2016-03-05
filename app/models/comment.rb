class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comments, :polymorphic => true

  
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
end
