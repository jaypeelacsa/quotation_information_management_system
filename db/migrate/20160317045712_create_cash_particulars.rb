class CreateCashParticulars < ActiveRecord::Migration
  def change
    create_table :cash_particulars do |t|
      t.string :particular
      t.float :amount

      t.timestamps null: false
    end
  end
end
