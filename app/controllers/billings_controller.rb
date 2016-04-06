class BillingsController < ApplicationController
		def index
			@billings= Billing.list_of_billings

			if params[:start_date].present? && params[:end_date].present?
				@start_date = params[:start_date]
				@end_date = params[:end_date]
				@billings = @billings.where(bill_date: (@start_date.to_date..@end_date.to_date))
			end
		end

		def print
			if ( current_user.role == 'Admin' )
			else
					redirect_to billings_path
			end
		end

		def print_all
			@billings= Billing.all
			@company_profiles = CompanyProfile.all
			@header = "List OF All Billing"
				if params[:start_date].present? && params[:end_date].present?
				@start_date = params[:start_date]
				@end_date = params[:end_date]
				@billings = @billings.where(bill_date: (@start_date.to_date..@end_date.to_date))
				@header = "List Of All Billing From "+@start_date+" To "+@end_date
			end
		end

		def new
			if ( current_user.role == 'Admin' )
					@billing = Billing.new
			else
					redirect_to billings_path
			end
		end

		def create
			@billing = Billing.new(billing_params)
			if @billing.save
				flash[:success] = "Successfully Added"
				redirect_to  billings_path
			else
				render "new"
			end
		end

		def show
			@billing = Billing.find(params[:id])
			@billing_particular = BillingParticular.new
			@billing_particulars = BillingParticular.where(billing_id: @billing.id)
		end

		def edit
			if ( current_user.role == 'Admin' )
				@billing = Billing.find(params[:id])
		else
				redirect_to billings_path
		end
			
		end

		def update
			@billing = Billing.find(params[:id])
			if @billing.update_attributes(billing_params)
				flash[:success] = "Successfully Updated"
				redirect_to  billings_path
			else
				render "edit"
			end
		end

		def destroy
			@billing = Billing.find(params[:id])
			@billing.destroy
			flash[:success] = "Successfully Deleted"
			redirect_to  billings_path
		end

	def details
		if ( current_user.role == 'Admin' )
			@billing = Billing.find(params[:id])
			@billing_particulars = BillingParticular.where(billing_id: @billing.id)
			@company_profiles = CompanyProfile.all
		else
			redirect_to employees_path
		end
	end

		def billing_params
			params.require(:billing).permit!
		end
end
