class CreateCashVouchers < ActiveRecord::Migration
  def change
    create_table :cash_vouchers do |t|
      t.integer :reference_no
      t.date :cash_date
      t.string :paid_to
      t.string :address
      t.string :received_from
      t.string :amount
      t.string :prepared_by
      t.string :checked_by
      t.string :approved_by

      t.timestamps null: false
    end
  end
end
