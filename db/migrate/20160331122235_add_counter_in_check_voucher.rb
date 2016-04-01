class AddCounterInCheckVoucher < ActiveRecord::Migration
  def change
  	add_column(:check_vouchers, :counter ,:integer)
  end
end
