class CreateSoftwareBrowsers < ActiveRecord::Migration
  def change
    create_table :software_browsers do |t|
      t.string :name
      t.integer :proposal_id

      t.timestamps null: false
    end
  end
end
