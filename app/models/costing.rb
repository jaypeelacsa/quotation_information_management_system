class Costing < ActiveRecord::Base

	belongs_to :proposal

	validates :description, presence: true
	validates :cost, presence: true
  

end
