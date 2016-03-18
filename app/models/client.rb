class Client < ActiveRecord::Base

STATUS=["active","inactive"]

has_many :billings
has_many :orders
def to_s
  	"#{company_name}"
end

end
