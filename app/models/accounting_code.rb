class AccountingCode < ActiveRecord::Base

  validates :name, presence: true
  validates :code, presence: true


	belongs_to :check_voucher
	belongs_to :check_account
end
