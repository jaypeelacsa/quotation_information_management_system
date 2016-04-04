class SoftwareRequirement < ActiveRecord::Base

	validates :component, presence: true  
  validates :cost, presence: true  
  
	
	
	belongs_to :proposal

end
