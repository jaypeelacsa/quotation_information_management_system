class CompanyProfilesController < ApplicationController
	
	def index
		@company_profiles = CompanyProfile.all
	end

	def new
		@company_profile = CompanyProfile.new
	end

	def create		
		@company_profile = CompanyProfile.new(company_profile_params)

		if @company_profile.save
			redirect_to company_profiles_path
		else
			render "new"
		end
	end

	def show
		@company_profile = CompanyProfile.all
	end

	def edit
		@company_profile = CompanyProfile.find(params[ :id])
	end

	def update
		@company_profile = CompanyProfile.find(params[ :id])

		if @company_profile.update_attributes(company_profile_params)
			redirect_to company_profile_path(@company_profile)
		else
			render "edit"
		end
	end

	def destroy
		@company_profile = CompanyProfile.find(params[ :id])
		@company_profile.destroy
		redirect_to company_profiles_path
	end


	def company_profile_params
			params.require(:company_profile).permit!
	end

end