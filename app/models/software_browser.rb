class SoftwareBrowser < ActiveRecord::Base

	validates :name, presence: true
  	
	belongs_to :proposal

end
