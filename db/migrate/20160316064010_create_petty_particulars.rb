class CreatePettyParticulars < ActiveRecord::Migration
  def change
    create_table :petty_particulars do |t|
      t.string :particular
      t.float :amount
      t.integer :petty_voucher_id

      t.timestamps null: false
    end
  end
end
