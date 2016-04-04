class Client < ActiveRecord::Base

	validates :client_name, presence: true
	validates :address, presence: true
  validates :telephone, presence: true
	validates :email_address, presence: true
	validates :company_name, presence: true
	validates :primary_contact, presence: true
	validates :secondary_contact, presence: true
	validates :website, presence: true
  validates :status, presence: true
	validates :tin, presence: true
	validates :company_address, presence: true

	STATUS=["active","inactive"]

	has_many :billings
	has_many :orders
	has_many :order_particulars
	has_many :service_products
	has_many :proposals

	def to_s
	  	"#{company_name}"
	end
	
	def to_s
	  	"#{client_name}"
	end

	scope :list_of_clients, -> { order(created_at: :desc) }

end
