class AddIdInWorkExperience < ActiveRecord::Migration
  def change
  	add_column(:work_experiences, :employee_id, :integer)
  end
end
