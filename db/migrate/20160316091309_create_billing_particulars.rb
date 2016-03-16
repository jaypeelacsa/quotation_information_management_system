class CreateBillingParticulars < ActiveRecord::Migration
  def change
    create_table :billing_particulars do |t|
      t.string :particular
      t.string :currency
      t.float :amount
      t.integer :billing_id

      t.timestamps null: false
    end
  end
end
