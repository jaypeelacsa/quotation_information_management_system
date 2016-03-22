class AddImageEmployee < ActiveRecord::Migration
  def change
  	add_attachment :employees, :profile
  end
end
