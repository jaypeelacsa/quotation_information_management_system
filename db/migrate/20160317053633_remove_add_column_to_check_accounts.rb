class RemoveAddColumnToCheckAccounts < ActiveRecord::Migration
  def change
  	remove_column(:check_accounts, :account_charge)
  	remove_column(:check_accounts, :account_code)
  	remove_column(:check_accounts, :debit)
  	remove_column(:check_accounts, :credit)
  	add_column(:check_accounts, :accounting_code_id, :integer)
  	add_column(:check_accounts, :amount, :decimal)
  	add_column(:check_accounts, :trans_type, :string)
  end
end
