class User < ActiveRecord::Base
    has_many :posts
    before_save { self.email = email.downcase }
<<<<<<< Updated upstream
    before_save { self.role ||= :member}
    #before_save { self.role ||= :admin}
    #before_save { self.role ||= :moderator}
    
=======
    before_save { self.role ||= :member }
>>>>>>> Stashed changes
    
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 100 },
             format: { with: EMAIL_REGEX }

   has_secure_password
   enum role: [:member, :admin, :moderator]
<<<<<<< Updated upstream
=======
   
   def favorite_for(post)
     favorites.where(post_id: post.id).first
   end
   def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
   end
>>>>>>> Stashed changes
end

