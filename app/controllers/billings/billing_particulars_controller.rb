module Billings
	class BillingParticularsController < ApplicationController

			before_filter :load_defaults

			def new
				@billing_particular = BillingParticular.new
			end

			def create
				@billing_particular = BillingParticular.new(billing_particular_params)
				@billing_particular.billing = @billing
				if @billing_particular.save
					redirect_to billing_path(@billing)
				else
					render "new"
				end
			end

			def edit
				@billing_particular = BillingParticular.find(params[:id])
			end

			def update
				@billing_particular = BillingParticular.find(params[:id])
				@billing_particular.billing = @billing
				if @billing_particular.update_attributes(billing_particular_params)
					redirect_to billing_path(@billing)
				else
					render "edit"
				end
			end

			def destroy
				@billing_particular = BillingParticular.find(params[:id])
				@billing_particular.destroy
				redirect_to billing_path(@billing)
			end

			def billing_particular_params
				params.require(:billing_particular).permit!
			end

			def load_defaults
				@billing = Billing.find(params[:billing_id])
			end
	end
end