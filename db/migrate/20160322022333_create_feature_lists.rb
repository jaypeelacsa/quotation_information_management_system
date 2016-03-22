class CreateFeatureLists < ActiveRecord::Migration
  def change
    create_table :feature_lists do |t|
      t.string :name
      t.text :description
      t.integer :proposal_id
      t.integer :parent_feature_list_id

      t.timestamps null: false
    end
  end
end
