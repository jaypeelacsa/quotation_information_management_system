class Client < ActiveRecord::Base

	validates :client_name, presence: true
	validates :address, presence: true
  validates :telephone, presence: true
	validates :email_address, presence: true
	validates :company_name, presence: true
	validates :website, presence: true
  validates :status, presence: true
	validates :tin, presence: true
	validates :company_address, presence: true

	STATUS=["active","inactive"]
	has_many :billings

	has_many :orders
	def to_s
	  	"#{company_name}"
	end

	has_many :proposals

	def to_s
	  	"#{client_name}"
	end
end
