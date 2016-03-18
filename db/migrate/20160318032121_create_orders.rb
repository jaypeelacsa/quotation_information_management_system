class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :employee_id
      t.integer :client_id
      t.integer :service_product_id
      t.integer :quantity
      t.string :status

      t.timestamps null: false
    end
  end
end
