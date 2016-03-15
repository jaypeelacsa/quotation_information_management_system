class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|

      t.timestamps null: false
    end
  end
end
