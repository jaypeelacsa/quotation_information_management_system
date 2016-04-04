class Billing < ActiveRecord::Base

  validates :bill_no, presence: true
  validates :bill_date, presence: true
  validates :certified_by, presence: true
 
 	belongs_to :client
	has_many :billing_particulars
  accepts_nested_attributes_for :billing_particulars, reject_if: :all_blank, allow_destroy: true

  scope :list_of_billings, -> { order(created_at: :desc) }

end
