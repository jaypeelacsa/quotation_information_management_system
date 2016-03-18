class AddColumnInProposal < ActiveRecord::Migration
  add_column(:software_requirements, :proposal_id, :integer)
end
