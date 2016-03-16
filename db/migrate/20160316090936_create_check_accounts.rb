class CreateCheckAccounts < ActiveRecord::Migration
  def change
    create_table :check_accounts do |t|
      t.string :account_charge
      t.string :account_code
      t.decimal :debit
      t.decimal :credit
      t.integer :check_voucher_id

      t.timestamps null: false
    end
  end
end
