class AddLogoToCompanyProfile < ActiveRecord::Migration
  add_attachment :company_profiles, :logo
end
