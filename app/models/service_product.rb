class ServiceProduct < ActiveRecord::Base

	validates :name, presence: true
  validates :price, presence: true  
  validates :description, presence: true  
  validates :code, presence: true 
  validates :type, presence: true
  

	TYPE=["Service","Product"]
	self.inheritance_column = nil

	has_many :order_particulars
	# belongs_to :client

	scope :list_of_service_products, -> { order(created_at: :desc) }

end
