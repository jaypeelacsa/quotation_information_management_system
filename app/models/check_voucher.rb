class CheckVoucher < ActiveRecord::Base

	# validates :payee, presence: true
	# validates :reference_no, presence: true
 #  validates :check_date, presence: true
	# validates :bank, presence: true
	# validates :received_by, presence: true
	# validates :prepared_by, presence: true
 #  validates :certified_by, presence: true
	# validates :approved_by, presence: true
	# validates :check_no, presence: true
	# validates :or_no, presence: true
 #  validates :si_no, presence: true
	# validates :apv_no, presence: true

	has_many :check_particulars
  accepts_nested_attributes_for :check_particulars, reject_if: :all_blank, allow_destroy: true
  has_many :check_accounts
  accepts_nested_attributes_for :check_accounts, reject_if: :all_blank, allow_destroy: true
  has_many :accounting_codes
	
	def to_s
  	"#{reference_no}-#{counter}"
  end

end
