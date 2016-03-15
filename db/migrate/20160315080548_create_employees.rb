class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :position
      t.string :email
      t.string :contact_no
      t.date :birthdate
      t.string :address

      t.timestamps null: false
    end
  end
end
