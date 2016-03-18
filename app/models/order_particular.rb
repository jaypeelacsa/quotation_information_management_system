class OrderParticular < ActiveRecord::Base
	belongs_to :order
	belongs_to :service_product

	before_save :default_values
  def default_values
    self.status ||= 'Pending'
  end
end
