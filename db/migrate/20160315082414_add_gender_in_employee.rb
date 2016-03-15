class AddGenderInEmployee < ActiveRecord::Migration
  def change
  	add_column(:employees, :gender, :string)
  end
end
