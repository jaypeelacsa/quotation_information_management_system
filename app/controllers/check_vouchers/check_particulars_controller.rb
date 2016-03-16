module CheckVouchers
	class CheckParticularsController < ApplicationController

			before_filter :load_defaults

			def index
				@check_particulars = CheckParticular.all
			end

			def new
				@check_particular = CheckParticular.new
			end

			def create
				@check_particular = CheckParticular.new(check_particular_params)
				@check_particular.check_voucher = @check_voucher
				if @check_particular.save
					redirect_to check_voucher_path(@check_voucher)
				else
					render "new"
				end
			end

			def show
				@check_voucher = CheckVoucher.find(params[:id])
			end

			def edit
				@check_particular = CheckParticular.find(params[:id])
			end

			def update
				@check_particular = CheckParticular.find(params[:id])
				@check_particular.check_voucher = @check_voucher
				if @check_particular.update_attributes(check_particular_params)
					redirect_to check_voucher_path(@check_voucher)
				else
					render "edit"
				end
			end

			def destroy
				@check_particular = CheckParticular.find(params[:id])
				@check_particular.destroy
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