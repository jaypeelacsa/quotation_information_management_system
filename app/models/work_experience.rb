class WorkExperience < ActiveRecord::Base
	belongs_to :employee
  validates :title, presence: true
  validates :company_name, presence: true

end
