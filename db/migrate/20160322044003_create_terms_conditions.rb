class CreateTermsConditions < ActiveRecord::Migration
  def change
    create_table :terms_conditions do |t|
      t.string :name
      t.text :content
      t.integer :proposal_id

      t.timestamps null: false
    end
  end
end
