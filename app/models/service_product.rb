class ServiceProduct < ActiveRecord::Base

	TYPE=["Service","Product"]
	self.inheritance_column = nil

	has_many :order_particulars
	belongs_to :client

	scope :list_of_service_products, -> { order(created_at: :desc) }

end
