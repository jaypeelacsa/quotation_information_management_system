class CreateSoftwareRequirements < ActiveRecord::Migration
  def change
    create_table :software_requirements do |t|
      t.string :component
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
