class FeatureList < ActiveRecord::Base
	
	belongs_to :proposal
	
	belongs_to :parent_feature_list, class_name: "FeatureList", :foreign_key => "parent_feature_list_id"

	def is_not_feature?
		if self.parent_feature_list_id.nil?
			true
		else
			false
		end
	end

	def list_of_features
		FeatureList.where(parent_feature_list_id: self.id)
	end

end
