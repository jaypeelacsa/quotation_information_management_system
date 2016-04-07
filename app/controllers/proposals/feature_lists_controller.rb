module Proposals
	class FeatureListsController < ApplicationController
		before_filter :load_defaults

		def new
			@feature_list = FeatureList.new
			if params[:parent_feature_list_id].present?
				parent_feature_list = FeatureList.find(params[:parent_feature_list_id])
				@feature_list.parent_feature_list = parent_feature_list
			end
			proposal = Proposal.find(params[:proposal_id])
		end

		def create
			@feature_list = FeatureList.new(feature_list_params)
			@feature_list.proposal = @proposal

			if @feature_list.save
				flash[:success] = "Successfully Added"
				redirect_to proposal_path(@proposal)
			else
				redirect_to proposal_path(@proposal)
			end
		end

		def show
			@feature_list = FeatureList.find(params[:id])
			proposal = Proposal.find(params[:proposal_id])
	    @feature_list = proposal.feature_lists.find(params[:id])
	  end
		def edit
			@feature_list = FeatureList.find(params[:id])
			proposal = Proposal.find(params[:proposal_id])
		  @feature_list = proposal.feature_lists.find(params[:id])
		end

		def update
			@feature_list = FeatureList.find(params[:id])
			proposal = Proposal.find(params[:proposal_id])
		  @feature_list = Proposal.feature_lists.find(params[:id])

		  if @feature_list.update_attributes(feature_list_params)
		  	flash[:success] = "Successfully Updated"
		  	redirect_to proposal_path(@feature_list.proposal_id)
		  else	
		  	render"edit"
		  end
		end

		def destroy

			@feature_list = FeatureList.find(params[:id])
			proposal = Proposal.find(params[:proposal_id])
		  @feature_list = proposal.feature_lists.find(params[:id])
		  @feature_list.destroy
		  flash[:success] = "Successfully Deleted"
		  redirect_to proposal_path(@proposal)
		end

		def feature_list_params
				params.require(:feature_list).permit!
		end

		def load_defaults
				@proposal = Proposal.find(params[:proposal_id])
		end
	end
end