class RemoveColumnInOrder < ActiveRecord::Migration
  def change
  	remove_column(:orders, :service_product_id)
  	remove_column(:orders, :quantity)
  	remove_column(:orders, :status)
  end
end
