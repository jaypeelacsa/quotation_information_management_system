class AddColumnToUser < ActiveRecord::Migration
  add_column(:users, :role ,:string)
end
