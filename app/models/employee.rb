class Employee < ActiveRecord::Base
	GENDER=["Male","Female"]
	has_many :work_experiences


  accepts_nested_attributes_for :work_experiences, allow_destroy: true

	def to_s
  	"#{firstname} #{middlename} #{lastname}"
  end
end
