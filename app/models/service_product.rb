class ServiceProduct < ActiveRecord::Base
	TYPE=["Service","Product"]
	self.inheritance_column = nil

	has_many :order_particulars
end
