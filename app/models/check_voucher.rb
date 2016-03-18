class CheckVoucher < ActiveRecord::Base
	has_many :check_particulars
  accepts_nested_attributes_for :check_particulars, reject_if: :all_blank, allow_destroy: true
  has_many :check_accounts
  accepts_nested_attributes_for :check_accounts, reject_if: :all_blank, allow_destroy: true

  has_many :accounting_codes
end
