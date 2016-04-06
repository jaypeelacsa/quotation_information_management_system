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
					flash[:success] = "Successfully Added"
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
					flash[:success] = "Successfully Updated"
					redirect_to proposal_path(@proposal)
				else
					render "edit"
				end
			end

			def destroy
				@costing = Costing.find(params[:id])
				@costing.destroy
				flash[:success] = "Successfully Deleted"
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