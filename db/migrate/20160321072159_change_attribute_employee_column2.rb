class ChangeAttributeEmployeeColumn2 < ActiveRecord::Migration
  def change
  	change_column :employees, :employee_no, :integer
  end
end
