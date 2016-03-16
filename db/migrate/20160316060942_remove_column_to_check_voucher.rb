class RemoveColumnToCheckVoucher < ActiveRecord::Migration
  def change
  	remove_column(:check_vouchers, :amount_in_word)
  	add_column(:check_vouchers, :si_no, :string)
  	add_column(:check_vouchers, :or_no, :string)
  	add_column(:check_vouchers, :apv_no, :string)
  end
end
