class AccountingCode < ActiveRecord::Base

  validates :name, presence: true
  validates :code, presence: true


	has_many :check_vouchers
	has_many :check_accounts

	scope :list_of_accounting_codes, -> { order(created_at: :desc) }
	
end
