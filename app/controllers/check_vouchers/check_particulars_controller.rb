module CheckVouchers
	class CheckParticularsController < ApplicationController

			before_filter :load_defaults
		
			def new
				@check_particular = CheckParticular.new
			end

			def create
				@check_particular = CheckParticular.new(check_particular_params)
				@check_particular.check_voucher = @check_voucher
				if @check_particular.save
					flash[:success] = "Successfully Added"
					redirect_to check_voucher_path(@check_voucher)
				else
					render "new"
				end
			end

			def edit
				@check_particular = CheckParticular.find(params[:id])
			end

			def update
				@check_particular = CheckParticular.find(params[:id])
				@check_particular.check_voucher = @check_voucher
				if @check_particular.update_attributes(check_particular_params)
					flash[:success] = "Successfully Updated"
					redirect_to check_voucher_path(@check_voucher)
				else
					render "edit"
				end
			end

			def destroy
				@check_particular = CheckParticular.find(params[:id])
				@check_particular.destroy
				flash[:success] = "Successfully Deleted"
				redirect_to check_voucher_path(@check_voucher)
			end

			def check_particular_params
				params.require(:check_particular).permit!
			end

			def load_defaults
				@check_voucher = CheckVoucher.find(params[:check_voucher_id])
			end
	end
end