class AddOrderIdOrderParticulars < ActiveRecord::Migration
  def change
  	add_column(:order_particulars, :order_id, :integer)
  end
end
