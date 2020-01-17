class User < ActiveRecord::Base
  acts_as_voter 
  has_many :visits, class_name: "Ahoy::Visit"
  has_many :events, class_name: "Ahoy::Event"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :omniauthable, omniauth_providers: [:twitter]
  enum gender_types: { 
      not_telling: 0,
      male: 1,
      female: 2,
      other: 3
      }
      
  def self.create_from_provider_data(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      puts(auth)
      user.username = auth.info.nickname
      user.first_name  = auth.info.name              # assuming the user model has a name
      #user.email = auth.info.email            # since we are using twitter, which hasn't got any email, we'll just comment this
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

  def active_for_authentication?
    super && !self.banned?
  end

  def inactive_message
    active_for_authentication? ? super : :locked
  end

end
  
