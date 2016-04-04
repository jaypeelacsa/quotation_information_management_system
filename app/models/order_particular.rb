class OrderParticular < ActiveRecord::Base
	belongs_to :order
	belongs_to :employee
	belongs_to :service_product

	before_save :default_values
	  def default_values
	    self.status ||= 'pending'
	  end

	# before_validation :default_pending

		# def default_pending
		# 	if self.new_record?
		# end

	status = ["pending", "approved", "finished"]

	belongs_to :client


end
