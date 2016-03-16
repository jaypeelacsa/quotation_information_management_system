class Client < ActiveRecord::Base

STATUS=["active","inactive"]

has_many :billings

end
