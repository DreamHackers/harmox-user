class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  has_many :bots, dependent: :destroy

  validates :username, presence: true, uniqueness: true

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    #user.username = auth.info.nickname   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
  end
end

def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.twitter_data"]
      user.username = data["info"]["nickname"]
      user.provider = data["provider"]
      user.uid = data["uid"]

      user.valid?
    end
  end
end

def password_required?
  super && provider.blank?
end

def email_required?
  super && provider.blank?
end
end
