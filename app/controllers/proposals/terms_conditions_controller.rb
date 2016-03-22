module Proposals
	class TermsConditionsController < ApplicationController

			before_filter :load_defaults

			def new
				@terms_condition = TermsCondition.new
			end

			def create
				@terms_condition = TermsCondition.new(terms_condition_params)
				@terms_condition.proposal = @proposal
				if @terms_condition.save
					redirect_to proposal_path(@proposal)
				else
					render "new"
				end
			end

			def edit
				@terms_condition = TermsCondition.find(params[:id])
			end

			def update
				@terms_condition = TermsCondition.find(params[:id])
				@terms_condition.proposal = @proposal
				if @terms_condition.update_attributes(terms_condition_params)
					redirect_to proposal_path(@proposal)
				else
					render "edit"
				end
			end

			def destroy
				@terms_condition = TermsCondition.find(params[:id])
				@terms_condition.destroy
				redirect_to proposal_path(@proposal)
			end

			def terms_condition_params
				params.require(:terms_condition).permit!
			end

			def load_defaults
				@proposal = Proposal.find(params[:proposal_id])
			end
	end
end