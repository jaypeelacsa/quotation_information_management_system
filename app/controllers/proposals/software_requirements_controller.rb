module Proposals
	class SoftwareRequirementsController < ApplicationController

			before_filter :load_defaults

			def new
				@software_requirement = SoftwareRequirement.new
			end

			def create
				@software_requirement = SoftwareRequirement.new(software_requirement_params)
				@software_requirement.proposal = @proposal
				if @software_requirement.save
					flash[:success] = "Successfully Added"
					redirect_to proposal_path(@proposal)
				else
					render "new"
				end
			end

			def edit
				@software_requirement = SoftwareRequirement.find(params[:id])
			end

			def update
				@software_requirement = SoftwareRequirement.find(params[:id])
				@software_requirement.proposal = @proposal
				if @software_requirement.update_attributes(software_requirement_params)
					flash[:success] = "Successfully Updated"
					redirect_to proposal_path(@proposal)
				else
					render "edit"
				end
			end

			def destroy
				@software_requirement = SoftwareRequirement.find(params[:id])
				@software_requirement.destroy
				flash[:success] = "Successfully Deleted"
				redirect_to proposal_path(@proposal)
			end

			def software_requirement_params
				params.require(:software_requirement).permit!
			end

			def load_defaults
				@proposal = Proposal.find(params[:proposal_id])
			end
	end
end