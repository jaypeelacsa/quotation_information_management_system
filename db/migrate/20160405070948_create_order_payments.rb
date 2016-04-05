class CreateOrderPayments < ActiveRecord::Migration
  def change
    create_table :order_payments do |t|
      t.integer :payment_no
      t.date :payment_date
      t.string :particular
      t.string :currency
      t.float :amount
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
