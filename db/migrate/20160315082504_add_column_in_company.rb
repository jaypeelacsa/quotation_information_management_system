class AddColumnInCompany < ActiveRecord::Migration

	add_column(:company_profiles, :mission, :text)
	add_column(:company_profiles, :vission, :text)

end
