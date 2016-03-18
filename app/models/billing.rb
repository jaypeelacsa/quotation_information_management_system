class Billing < ActiveRecord::Base
	belongs_to :client

	has_many :billing_particulars
  accepts_nested_attributes_for :billing_particulars, reject_if: :all_blank, allow_destroy: true


end
