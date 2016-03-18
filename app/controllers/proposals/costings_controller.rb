module Proposals
	class CostingsController < ApplicationController

			before_filter :load_defaults

			def new
				@costing = Costing.new
			end

			def create
				@costing = Costing.new(costing_params)
				@costing.proposal = @proposal
				if @costing.save
					redirect_to proposal_path(@proposal)
				else
					render "new"
				end
			end

			def edit
				@costing = Costing.find(params[:id])
			end

			def update
				@costing = Costing.find(params[:id])
				@costing.proposal = @proposal
				if @costing.update_attributes(costing_params)
					redirect_to proposal_path(@proposal)
				else
					render "edit"
				end
			end

			def destroy
				@costing = Costing.find(params[:id])
				@costing.destroy
				redirect_to proposal_path(@proposal)
			end

			def costing_params
				params.require(:costing).permit!
			end

			def load_defaults
				@proposal = Proposal.find(params[:proposal_id])
			end
	end
end