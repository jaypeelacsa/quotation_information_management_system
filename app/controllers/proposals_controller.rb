class ProposalsController < ApplicationController
	
	def index
		@proposals = Proposal.list_of_proposals

		if params[:title].present?
			@title = params[:title]
			@proposals = @proposals.where("lower(title) LIKE :title",title: "%#{@title}")
		end

		if params[:start_date].present? && params[:end_date].present?
			@start_date = params[:start_date]
			@end_date = params[:end_date]
			@proposals = @proposals.where(proposal_date: (@start_date.to_date..@end_date.to_date))
		end
	end

	def new
		if ( current_user.role == 'Admin' )
				@proposal = Proposal.new
		else
				redirect_to proposals_path
		end
		
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

	def details
		if ( current_user.role == 'Admin' )
			@proposal = Proposal.find(params[:id])
			@software_requirements = SoftwareRequirement.where(proposal_id: @proposal.id)
			@software_browsers = SoftwareBrowser.where(proposal_id: @proposal.id)
			@costings = Costing.where(proposal_id: @proposal.id)
			@feature_lists = FeatureList.where(proposal_id: @proposal.id)
			@terms_conditions = TermsCondition.where(proposal_id: @proposal.id)
			@company_profiles = CompanyProfile.all
		else
			redirect_to employees_path
		end
	end

	def edit
		if ( current_user.role == 'Admin' )
				@proposal = Proposal.find(params[ :id])
		else
				redirect_to proposals_path
		end
		
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