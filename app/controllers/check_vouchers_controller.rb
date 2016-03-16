class CheckVouchersController < ApplicationController
	
	def index
		@check_vouchers = CheckVoucher.all
	end

	def new
		@check_voucher = CheckVoucher.new
	end

	def create		
		@check_voucher = CheckVoucher.new(check_voucher_params)

		if @check_voucher.save
			redirect_to check_vouchers_path
		else
			render "new"
		end
	end

	def show
		@check_voucher = CheckVoucher.all
	end

	def edit
		@check_voucher = CheckVoucher.find(params[ :id])
	end

	def update
		@check_voucher = CheckVoucher.find(params[ :id])

		if @check_voucher.update_attributes(check_voucher_params)
			redirect_to check_voucher_path(@check_voucher)
		else
			render "edit"
		end
	end

	def destroy
		@check_voucher = CheckVoucher.find(params[ :id])
		@check_voucher.destroy
		redirect_to check_vouchers_path
	end


	def check_voucher_params
			params.require(:check_voucher).permit!
	end

end