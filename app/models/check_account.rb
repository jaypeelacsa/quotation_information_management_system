class CheckAccount < ActiveRecord::Base


	validates :amount, presence: true
  validates :trans_type, presence: true
	

	
	belongs_to :check_voucher
	belongs_to :accounting_code
	#belongs_to_belongs_to_many accounting_codes
	POST_TYPE=["Debit","Credit"]
	
end
