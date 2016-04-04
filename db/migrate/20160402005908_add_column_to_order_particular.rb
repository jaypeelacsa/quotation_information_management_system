class AddColumnToOrderParticular < ActiveRecord::Migration
  add_column(:order_particulars, :client_id, :integer)
end
