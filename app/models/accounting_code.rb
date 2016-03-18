class AccountingCode < ActiveRecord::Base

	belongs_to :check_voucher
	belongs_to :check_account
end
