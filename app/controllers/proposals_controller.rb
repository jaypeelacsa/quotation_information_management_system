class ProposalsController < ApplicationController
	
	def index
		@proposals = Proposal.all
	end

	def new
		@proposal = Proposal.new
	end

	def create		
		@proposal = Proposal.new(proposal_params)

		if @proposal.save
			redirect_to proposals_path
		else
			render "new"
		end
	end

	def show
		@proposal = Proposal.find(params[:id])
		@software_requirement = SoftwareRequirement.new
		@software_requirements = SoftwareRequirement.where(proposal_id: @proposal.id)
		@software_browser = SoftwareBrowser.new
		@software_browsers = SoftwareBrowser.where(proposal_id: @proposal.id)
		@costing = Costing.new
		@costings = Costing.where(proposal_id: @proposal.id)
		@feature_list = FeatureList.new
		@feature_lists = FeatureList.where(proposal_id: @proposal.id)
		@terms_condition = TermsCondition.new
		@terms_conditions = TermsCondition.where(proposal_id: @proposal.id)
		
	end

	def edit
		@proposal = Proposal.find(params[ :id])
	end

	def update
		@proposal = Proposal.find(params[ :id])

		if @proposal.update_attributes(proposal_params)
			redirect_to proposal_path(@proposal)
		else
			render "edit"
		end
	end

	def destroy
		@proposal = Proposal.find(params[ :id])
		@proposal.destroy
		redirect_to proposals_path
	end


	def proposal_params
			params.require(:proposal).permit!
	end

end