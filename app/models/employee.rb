class Employee < ActiveRecord::Base
	GENDER=["Male","Female"]
	
	has_many :work_experiences
  accepts_nested_attributes_for :work_experiences, reject_if: :all_blank, allow_destroy: true

  has_many :orders
	def to_s
  	"#{firstname} #{middlename} #{lastname}"
  end
end
