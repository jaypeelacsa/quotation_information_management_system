class OrderPayment < ActiveRecord::Base

	validates :payment_no, presence: true
	validates :payment_date, presence: true
	validates :particular, presence: true
	validates :currency, presence: true	
	validates :amount, presence: true	

	belongs_to :order
end
