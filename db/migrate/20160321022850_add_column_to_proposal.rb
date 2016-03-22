class AddColumnToProposal < ActiveRecord::Migration
  add_attachment :proposals, :system_architecture
end
