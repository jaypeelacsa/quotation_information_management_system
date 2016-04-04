class AddColumnToAccountingCode < ActiveRecord::Migration
  add_column(:accounting_codes, :check_voucher_id, :integer)
end
