class AddColumn < ActiveRecord::Migration
  def change
  	add_column(:check_vouchers, :employee_id, :integer)
  	add_column(:cash_vouchers, :employee_id, :integer)
  	add_column(:petty_vouchers, :employee_id, :integer)
  end
end
