class Client < ActiveRecord::Base

STATUS=["active","inactive"]

has_many :billings
has_many :proposals

def to_s
  	"#{client_name}"
  end
end
