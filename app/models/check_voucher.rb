class CheckVoucher < ActiveRecord::Base

	validates :payee, presence: true
	validates :reference_no, presence: true
  validates :check_date, presence: true
	validates :bank, presence: true
	validates :received_by, presence: true
	validates :prepared_by, presence: true
  validates :certified_by, presence: true
	validates :approved_by, presence: true
	validates :check_no, presence: true
	validates :or_no, presence: true
  validates :si_no, presence: true
	validates :apv_no, presence: true

	has_many :check_particulars
  accepts_nested_attributes_for :check_particulars, reject_if: :all_blank, allow_destroy: true
  has_many :check_accounts
  accepts_nested_attributes_for :check_accounts, reject_if: :all_blank, allow_destroy: true
  has_many :accounting_codes
	
	# def load_defaults
	# 	if self.new_record?
	# 		if !self.reference_no.nil?
	#         self.reference_no = CheckVoucher.reference_no(self.check_voucher_id, Date.today.strftime("CV""%Y%m"))
	#       end
	#   end
	#  end
# if self.new_record?
#       if !self.branch.nil? and self.identification_number.nil?
#         self.identification_number = MemberService.generate_member_identification_number(self.branch.cluster.code, self.branch.code, self.branch)
#       end
# def ref
# 	Date.today.strftime("CV""%Y%m")
# 	end
end
