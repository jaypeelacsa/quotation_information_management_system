class AddColumnToCompanyProfile < ActiveRecord::Migration
	add_column(:company_profiles, :company_name, :string)
	add_column(:company_profiles, :address, :text)
	add_column(:company_profiles, :telephone, :string)
	add_column(:company_profiles, :website, :string)
	add_column(:company_profiles, :tin, :string)
end
