class ServiceProduct < ActiveRecord::Base
	TYPE=["Service","Product"]
	self.inheritance_column = nil
end
