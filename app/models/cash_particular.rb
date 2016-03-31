class CashParticular < ActiveRecord::Base

	validates :particular, presence: true
  validates :amount, presence: true
  
	belongs_to :cash_voucher
end
