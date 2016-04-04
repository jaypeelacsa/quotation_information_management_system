class PettyVoucher < ActiveRecord::Base

	validates :petty_date, presence: true
	validates :payee, presence: true
	validates :approved_by, presence: true
	validates :paid_by, presence: true	
	validates :received_by, presence: true	
	validates :reference_no, presence: true	


	has_many :petty_particulars
  accepts_nested_attributes_for :petty_particulars, reject_if: :all_blank, allow_destroy: true

  scope :list_of_petty_vouchers, -> { order(created_at: :desc) }

end
