class CheckVoucher < ActiveRecord::Base

	validates :payee, presence: true
	validates :check_date, presence: true
	validates :bank, presence: true
	validates :received_by, presence: true
  validates :certified_by, presence: true
	validates :approved_by, presence: true
	validates :check_no, presence: true
	validates :or_no, presence: true
  validates :si_no, presence: true
	validates :apv_no, presence: true

	belongs_to :employee
	has_many :check_particulars
  accepts_nested_attributes_for :check_particulars, reject_if: :all_blank, allow_destroy: true
  has_many :check_accounts
  accepts_nested_attributes_for :check_accounts, reject_if: :all_blank, allow_destroy: true
  
  belongs_to :accounting_code
	
	def to_s
  	"#{reference_no}-#{counter}"
  end

  scope :list_of_check_vouchers, -> { order(created_at: :desc) }

end
