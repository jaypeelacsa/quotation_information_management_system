class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column(:check_vouchers, :prepared_by)
  	remove_column(:cash_vouchers, :prepared_by)
  	remove_column(:petty_vouchers, :paid_by)
  end
end
