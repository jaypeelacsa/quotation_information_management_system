class PettyVoucher < ActiveRecord::Base
	has_many :petty_particulars
  accepts_nested_attributes_for :petty_particulars, reject_if: :all_blank, allow_destroy: true

  scope :list_of_petty_vouchers, -> { order(created_at: :desc) }

end
