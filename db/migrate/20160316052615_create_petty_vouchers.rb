class CreatePettyVouchers < ActiveRecord::Migration
  def change
    create_table :petty_vouchers do |t|
      t.string :reference_no
      t.date :petty_date

      t.timestamps null: false
    end
  end
end
