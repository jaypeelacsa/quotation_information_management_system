class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  ROLE=["Admin","Normal"]

 #  def sign_up_params
 #  	devise_parameter_sanitizer.sanitize(:sign_up)
	# end
	# class User < ActiveRecord::Base
 #      def self.omniauth(auth)
 #        where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
 #          user.provider = auth.provider
 #          user.uid = auth.uid
 #          user.name = auth.info.name
 #          user.image = auth.info.image
 #          user.token = auth.credentials.token
 #          user.expires_at = Time.at(auth.credentials.expires_at)
 #          user.save!
 #      end
 #    end
  # end
end
