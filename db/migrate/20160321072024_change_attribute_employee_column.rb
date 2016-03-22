class ChangeAttributeEmployeeColumn < ActiveRecord::Migration
  def change
  	change_column :employees, :employee_no, :string
  end
end
