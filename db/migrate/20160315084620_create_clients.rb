class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :address
      t.string :telephone
      t.string :email_address
      t.string :company_name
      t.string :website
      t.string :status
      t.string :tin
      t.string :company_address

      t.timestamps null: false
    end
  end
end
