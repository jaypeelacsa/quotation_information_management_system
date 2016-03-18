class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.date :proposal_date
      t.text :overview
      t.text :objective
      t.text :hardware
      t.text :software
      t.text :feature
      t.string :project_costing_text
      t.text :signatory
      t.integer :employee_id
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
