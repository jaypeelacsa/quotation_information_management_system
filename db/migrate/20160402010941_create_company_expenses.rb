class CreateCompanyExpenses < ActiveRecord::Migration
  def change
    create_table :company_expenses do |t|
      t.string :name
      t.decimal :amount
      t.text :remarks
      t.date :exdate

      t.timestamps null: false
    end
  end
end
