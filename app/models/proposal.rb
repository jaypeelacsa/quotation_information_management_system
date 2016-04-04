class Proposal < ActiveRecord::Base
	
	belongs_to :employee
	belongs_to :client

	has_many :software_requirements
  accepts_nested_attributes_for :software_requirements, reject_if: :all_blank, allow_destroy: true
  has_many :software_browsers
  accepts_nested_attributes_for :software_browsers, reject_if: :all_blank, allow_destroy: true
  has_many :costings
  accepts_nested_attributes_for :costings, reject_if: :all_blank, allow_destroy: true
  has_many :feature_lists
  accepts_nested_attributes_for :feature_lists, reject_if: :all_blank, allow_destroy: true
  has_many :terms_conditions
  accepts_nested_attributes_for :terms_conditions, reject_if: :all_blank, allow_destroy: true


  has_attached_file :system_architecture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :system_architecture, content_type: /\Aimage\/.*\Z/

  scope :list_of_proposals, -> { order(created_at: :desc) }

end
