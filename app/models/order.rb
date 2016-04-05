class Order < ActiveRecord::Base
	
	belongs_to :employee
	belongs_to :client

	scope :list, -> { order(created_at: :desc) }

	has_many :order_particulars
  accepts_nested_attributes_for :order_particulars, reject_if: :all_blank, allow_destroy: true

  has_many :order_payments
  accepts_nested_attributes_for :order_payments, reject_if: :all_blank, allow_destroy: true

	scope :list_of_orders, -> { order(created_at: :desc) }  
  
end
