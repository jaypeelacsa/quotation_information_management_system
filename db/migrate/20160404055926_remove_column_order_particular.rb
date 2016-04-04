class RemoveColumnOrderParticular < ActiveRecord::Migration
  def change
  	remove_column(:order_particulars, :balance)
  end
end
