class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  ROLE=["Admin","Normal"]

   def to_s
      "#{firstname} #{middlename} #{lastname}"
    end
end
