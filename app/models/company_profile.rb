class CompanyProfile < ActiveRecord::Base

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/


	validates :company_name, presence: true
	validates :address, presence: true
  validates :telephone, presence: true
	validates :website, presence: true
	validates :tin, presence: true
	validates :mission, presence: true
	validates :vission, presence: true
	validates :email_add, presence: true
	
end
