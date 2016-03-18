class CreateOrderParticulars < ActiveRecord::Migration
  def change
    create_table :order_particulars do |t|
      t.integer :service_product_id
      t.integer :quantity
      t.string :status

      t.timestamps null: false
    end
  end
end
