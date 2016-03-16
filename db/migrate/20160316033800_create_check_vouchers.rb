class CreateCheckVouchers < ActiveRecord::Migration
  def change
    create_table :check_vouchers do |t|
      t.string :payee
      t.string :reference_no
      t.date :check_date
      t.text :amount_in_word
      t.string :bank
      t.string :received_by
      t.string :prepared_by
      t.string :certified_by
      t.string :approved_by

      t.timestamps null: false
    end
  end
end
