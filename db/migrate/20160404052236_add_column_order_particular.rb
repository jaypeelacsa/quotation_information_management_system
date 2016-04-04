class AddColumnOrderParticular < ActiveRecord::Migration
  def change
  	add_column(:order_particulars, :balance, :float)
  end
end
