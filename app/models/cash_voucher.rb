class CashVoucher < ActiveRecord::Base
	

  validates :cash_date, presence: true
  validates :paid_to, presence: true
  validates :address, presence: true
	validates :received_from, presence: true
  validates :amount, presence: true
  validates :checked_by, presence: true
	validates :approved_by, presence: true

  belongs_to :employee
	has_many :cash_particulars
  accepts_nested_attributes_for :cash_particulars, reject_if: :all_blank, allow_destroy: true

  scope :list_of_cash_vouchers, -> { order(created_at: :desc) }

end
