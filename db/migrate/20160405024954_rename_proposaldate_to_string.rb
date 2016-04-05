class RenameProposaldateToString < ActiveRecord::Migration
  remove_column(:proposals, :proposal_date)
  add_column(:proposals, :proposal_date, :string)
end
