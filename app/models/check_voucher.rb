class CheckVoucher < ActiveRecord::Base

has_many :check_particulars
  accepts_nested_attributes_for :check_particulars, reject_if: :all_blank, allow_destroy: true

end
