class CheckAccount < ActiveRecord::Base
	
	belongs_to :check_voucher
	belongs_to :accounting_code

	POST_TYPE=["Debit","Credit"]
	
end
