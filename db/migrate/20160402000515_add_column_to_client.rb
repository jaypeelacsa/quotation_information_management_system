class AddColumnToClient < ActiveRecord::Migration
  add_column(:clients, :primary_contact, :string)
  add_column(:clients, :secondary_contact, :string)
  add_column(:clients, :order_id, :integer)
end
