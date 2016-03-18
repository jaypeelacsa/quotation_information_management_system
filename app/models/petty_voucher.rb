class PettyVoucher < ActiveRecord::Base
	has_many :petty_particulars
  accepts_nested_attributes_for :petty_particulars, reject_if: :all_blank, allow_destroy: true

  
end
