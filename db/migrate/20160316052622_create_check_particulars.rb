class CreateCheckParticulars < ActiveRecord::Migration
  def change
    create_table :check_particulars do |t|
      t.string :particular
      t.decimal :amount
      t.integer :check_voucher_id

      t.timestamps null: false
    end
  end
end
