class CreateCostings < ActiveRecord::Migration
  def change
    create_table :costings do |t|
      t.string :description
      t.decimal :cost
      t.integer :proposal_id

      t.timestamps null: false
    end
  end
end
