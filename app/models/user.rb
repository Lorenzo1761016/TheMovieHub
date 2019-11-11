class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :omniauthable, omniauth_providers: [:twitter]
  #attr_accessor :remember_token
  #before_save { self.email = email.downcase }
  #validates :name, presence: true, length: { maximum: 50 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: { maximum: 255 },
  #                  format: { with: VALID_EMAIL_REGEX },
  #                  uniqueness: { case_sensitive: false }
  #has_secure_password
  #validates :password, length: { minimum: 6 }, allow_blank: true
 # 
 # def User.digest(string)
 #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
 #                                                 BCrypt::Engine.cost
 #   BCrypt::Password.create(string, cost: cost)
 # end##

  # Ret#urns a random token.
  #def User.new_token
  #  SecureRandom.urlsafe_base64
  #end#
#
#  def remember
#    self.remember_token = User.new_token
#    update_attribute(:remember_digest, User.digest(remember_token))
#  end

 # def authenticated?(remember_token)
 #   return false if remember_digest.nil?
#    BCrypt::Password.new(remember_digest).is_password?(remember_token)
#  end

  # Forgets a user.
  #def forget
   # update_attribute(:remember_digest, nil)
  #end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

end
  
