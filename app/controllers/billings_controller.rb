class BillingsController < ApplicationController
		def index
			@billings= Billing.all

			if params[:start_date].present? && params[:end_date].present?
				@start_date = params[:start_date]
				@end_date = params[:end_date]
				@billings = @billings.where(bill_date: (@start_date.to_date..@end_date.to_date))
			end
		end

		def new
			@billing = Billing.new
		end

		def create
			@billing = Billing.new(billing_params)
			if @billing.save
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
			@billing = Billing.find(params[:id])
		end

		def update
			@billing = Billing.find(params[:id])
			if @billing.update_attributes(billing_params)
				redirect_to  billings_path
			else
				render "edit"
			end
		end

		def destroy
			@billing = Billing.find(params[:id])
			@billing.destroy
			redirect_to  billings_path
		end

		def billing_params
			params.require(:billing).permit!
		end
end
