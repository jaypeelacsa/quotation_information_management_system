class AddColumnInEmployee < ActiveRecord::Migration
  def change
  	add_column(:employees, :employee_no, :integer)
  	add_column(:employees, :date_employed, :date)
  	add_column(:employees, :status, :string)
  end
end
