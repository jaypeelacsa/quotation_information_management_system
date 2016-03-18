module Proposals
	class SoftwareBrowsersController < ApplicationController

			before_filter :load_defaults

			def new
				@software_browser = SoftwareBrowser.new
			end

			def create
				@software_browser = SoftwareBrowser.new(software_browser_params)
				@software_browser.proposal = @proposal
				if @software_browser.save
					redirect_to proposal_path(@proposal)
				else
					render "new"
				end
			end

			def edit
				@software_browser = SoftwareBrowser.find(params[:id])
			end

			def update
				@software_browser = SoftwareBrowser.find(params[:id])
				@software_browser.proposal = @proposal
				if @software_browser.update_attributes(software_browser_params)
					redirect_to proposal_path(@proposal)
				else
					render "edit"
				end
			end

			def destroy
				@software_browser = SoftwareBrowser.find(params[:id])
				@software_browser.destroy
				redirect_to proposal_path(@proposal)
			end

			def software_browser_params
				params.require(:software_browser).permit!
			end

			def load_defaults
				@proposal = Proposal.find(params[:proposal_id])
			end
	end
end