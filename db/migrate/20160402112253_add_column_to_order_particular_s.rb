class AddColumnToOrderParticularS < ActiveRecord::Migration
  add_column(:orders, :order_particular_id, :integer)
end
