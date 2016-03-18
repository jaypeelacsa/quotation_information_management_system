class Order < ActiveRecord::Base
	belongs_to :employee
	belongs_to :client

	has_many :order_particulars
  accepts_nested_attributes_for :order_particulars, reject_if: :all_blank, allow_destroy: true
end
