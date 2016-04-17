class AddColumnEmailAdd < ActiveRecord::Migration
  add_column(:company_profiles, :email_add, :text)
end
