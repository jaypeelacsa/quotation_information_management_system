class AddColumnToCheckVoucher < ActiveRecord::Migration
  add_column(:check_vouchers, :check_no, :string)
end
