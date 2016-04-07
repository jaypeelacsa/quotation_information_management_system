module PettyVouchers
	class PettyParticularsController < ApplicationController

			before_filter :load_defaults

			def new
				@petty_particular = PettyParticular.new
			end

			def create
				@petty_particular = PettyParticular.new(petty_particular_params)
				@petty_particular.petty_voucher = @petty_voucher
				if @petty_particular.save
					flash[:success] = "Successfully Added"
					redirect_to petty_voucher_path(@petty_voucher)
				else
					redirect_to petty_voucher_path(@petty_voucher)
				end
			end

			def edit
				@petty_particular = PettyParticular.find(params[:id])
			end

			def update
				@petty_particular = PettyParticular.find(params[:id])
				@petty_particular.petty_voucher = @petty_voucher
				if @petty_particular.update_attributes(petty_particular_params)
					flash[:success] = "Successfully Updated"
					redirect_to petty_voucher_path(@petty_voucher)
				else
					render "edit"
				end
			end

			def destroy
				@petty_particular = PettyParticular.find(params[:id])
				@petty_particular.destroy
				flash[:success] = "Successfully Deleted"
				redirect_to petty_voucher_path(@petty_voucher)
			end

			def petty_particular_params
				params.require(:petty_particular).permit!
			end

			def load_defaults
				@petty_voucher = PettyVoucher.find(params[:petty_voucher_id])
			end
	end
end