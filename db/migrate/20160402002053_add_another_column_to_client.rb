class AddAnotherColumnToClient < ActiveRecord::Migration
  add_column(:clients, :order_particular_id, :integer)
end
