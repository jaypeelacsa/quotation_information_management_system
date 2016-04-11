class RenameColumnProjectCosting < ActiveRecord::Migration
  def change
  	remove_column(:proposals, :project_costing_text)
  	add_column(:proposals, :project_costing_description, :text)
  end
end
