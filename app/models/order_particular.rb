class OrderParticular < ActiveRecord::Base

	validates :quantity, presence: true
	validates :status, presence: true
	

	belongs_to :order
	belongs_to :employee
	belongs_to :service_product

	before_save :default_values
	  def default_values
	    self.status ||= 'pending'
	  end

	status = ["pending", "approved", "finished"]

	belongs_to :client


end
