class CashVoucher < ActiveRecord::Base
	has_many :cash_particulars
  accepts_nested_attributes_for :cash_particulars, reject_if: :all_blank, allow_destroy: true
end
