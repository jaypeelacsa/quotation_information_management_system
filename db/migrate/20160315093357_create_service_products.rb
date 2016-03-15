class CreateServiceProducts < ActiveRecord::Migration
  def change
    create_table :service_products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :code
      t.string :type

      t.timestamps null: false
    end
  end
end
