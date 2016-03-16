class AddColumnPettyVoucher < ActiveRecord::Migration
  def change
  		add_column(:petty_vouchers, :payee, :string)
  		add_column(:petty_vouchers, :approved_by, :string)
  		add_column(:petty_vouchers, :paid_by, :string)
  		add_column(:petty_vouchers, :received_by, :string)
  end
end
