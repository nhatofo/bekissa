class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	has_many :rooms

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, 
    :confirmable, :omniauthable
  validates :fullname, presence: true, length: {maximum: 50}

  def self.from_omniauth(auth)
  	user = User.where(:email => auth.info.email).first

  	if user
  		return user
  	else
  		where(provider: auth.provider, uid: auth.uid).first_or_create do |usr|
        usr.fullname = auth.info.name
        usr.provider = auth.provider
        usr.uid = auth.uid
        usr.email = auth.info.email
        usr.image = auth.info.image
        usr.password = Devise.friendly_token[0,20]
       end
  	end
  end
end


