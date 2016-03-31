class CheckAccount < ActiveRecord::Base


	validates :accounting_code_id, presence: true
	validates :amount, presence: true
  validates :trans_type, presence: true
	

	
	belongs_to :check_voucher
	belongs_to :accounting_code
	# has_and_belongs_to_many :accounting_codes
	POST_TYPE=["Debit","Credit"]
	
end
