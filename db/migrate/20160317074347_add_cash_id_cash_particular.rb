class AddCashIdCashParticular < ActiveRecord::Migration
  def change
  	add_column(:cash_particulars, :cash_voucher_id, :integer)
  end
end
