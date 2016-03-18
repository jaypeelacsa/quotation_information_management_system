class CreateAccountingCodes < ActiveRecord::Migration
  def change
    create_table :accounting_codes do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
