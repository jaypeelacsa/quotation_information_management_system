class Proposal < ActiveRecord::Base
	belongs_to :employee
	belongs_to :client

	has_many :software_requirements
  accepts_nested_attributes_for :software_requirements, reject_if: :all_blank, allow_destroy: true
  has_many :software_browsers
  accepts_nested_attributes_for :software_browsers, reject_if: :all_blank, allow_destroy: true
   has_many :costings
  accepts_nested_attributes_for :costings, reject_if: :all_blank, allow_destroy: true

end
