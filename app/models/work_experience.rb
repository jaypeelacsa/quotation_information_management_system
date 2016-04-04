class WorkExperience < ActiveRecord::Base

	belongs_to :employee

  validates :title, presence: true
  validates :company_name, presence: true
  validates :company_address, presence: true 
  validates :date_ended, presence: true

end
