class CheckAccount < ActiveRecord::Base
	
	belongs_to :check_voucher
	belongs_to :accounting_code
	# has_and_belongs_to_many :accounting_codes
	POST_TYPE=["Debit","Credit"]
	
end
