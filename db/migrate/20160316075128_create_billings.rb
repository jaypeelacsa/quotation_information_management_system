class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.integer :bill_no
      t.date :bill_date
      t.string :certified_by
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
