class Topic < ActiveRecord::Base
    has_many :sponsored_post, dependent: :destroy

    has_many :post, dependent: :destroy
   
end
