class CompanyProfilesController < ApplicationController
	
	def index
		@company_profiles = CompanyProfile.all
	end

	def new
		if ( current_user.role == 'Admin' )
				@company_profile = CompanyProfile.new
			else
				redirect_to company_profiles_path
			end
		
	end

	def create		
		@company_profile = CompanyProfile.new(company_profile_params)

		if @company_profile.save
			flash[:success] = "Successfully Added"
			redirect_to company_profiles_path
		else
			render "new"
		end
	end

	def show
		@company_profile = CompanyProfile.find(params[:id])
	end

	def edit
		if ( current_user.role == 'Admin' )
				@company_profile = CompanyProfile.find(params[ :id])
			else
				redirect_to company_profiles_path
			end
		
	end

	def update
		@company_profile = CompanyProfile.find(params[ :id])

		if @company_profile.update_attributes(company_profile_params)
			flash[:success] = "Successfully Updated"
			redirect_to company_profiles_path
		else
			render "edit"
		end
	end

	def destroy
		@company_profile = CompanyProfile.find(params[ :id])
		@company_profile.destroy
		flash[:success] = "Successfully Deleted"
		redirect_to company_profiles_path
	end


	def company_profile_params
			params.require(:company_profile).permit!
	end
end