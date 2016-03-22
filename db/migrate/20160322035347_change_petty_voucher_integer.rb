class ChangePettyVoucherInteger < ActiveRecord::Migration
  def change
  	change_column :petty_vouchers, :reference_no, :integer
  end
end
