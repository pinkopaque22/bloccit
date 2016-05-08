class Topic < ActiveRecord::Base
    has_many :posts, dependent: :destroy
<<<<<<< HEAD
=======
    #has_many :commentable, foreign_key: :commentable_id, dependent: :destroy
    has_many :comments
>>>>>>> checkpoint-48-API-retrieving-data
    has_many :labelings, as: :labelable
    has_many :labels, through: :labelings
    #has_many :commentable, foreign_key: :commentable_id, dependent: :destroy
    has_many :comments
    
   scope :visible_to, -> (user) { user ? all : where(public: true) }

    
end
