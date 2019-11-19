class User < ActiveRecord::Base
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :omniauthable, omniauth_providers: [:twitter]
  
  enum gender: [:undisclosed, :female, :male, :other]
  def self.create_from_provider_data(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name  = auth.info.name              # assuming the user model has a name
      #user.email = auth.info.email   # assuming the user model has an email address
      user.password = Devise.friendly_token[0, 20]
      user.provider = auth.provider
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

  def email_required?
    super && provider.blank?
  end

end
  
