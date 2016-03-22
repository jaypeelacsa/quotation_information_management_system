class Employee < ActiveRecord::Base

	has_many :proposals
	GENDER=["Male","Female"]
  STATUS=["Regular","Permanent","Contractual","Fired"]
	
	has_many :work_experiences
  accepts_nested_attributes_for :work_experiences, reject_if: :all_blank, allow_destroy: true

  has_many :orders
	def to_s
  	"#{firstname} #{middlename} #{lastname}"
  end


  has_attached_file :profile, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile, content_type: /\Aimage\/.*\Z/


  before_save :default_values
  def default_values
    self.status ||= 'Regular'
  end

  # def total_year
  #   ((Time.now - date_employed.to_time)/ (60*60*24*356)).floor
  # end

end
