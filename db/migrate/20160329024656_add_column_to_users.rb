class AddColumnToUsers < ActiveRecord::Migration
  add_column(:users, :firstname, :string)
	add_column(:users, :middlename, :string)
	add_column(:users, :lastname, :string)
	add_column(:users, :username, :string)
end
