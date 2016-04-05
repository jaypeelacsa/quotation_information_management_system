class BackToDateProposal < ActiveRecord::Migration
	remove_column(:proposals, :proposal_date)
  add_column(:proposals, :proposal_date, :date)
end
