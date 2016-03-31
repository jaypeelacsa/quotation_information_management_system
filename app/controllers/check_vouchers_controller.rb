class CheckVouchersController < ApplicationController
	
	def index
		@check_vouchers = CheckVoucher.all
	end

	def new
		if ( current_user.role == 'Admin' )
			@check_voucher = CheckVoucher.new
		else
			redirect_to check_vouchers_path
		end

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
		@check_voucher = CheckVoucher.find(params[:id])
		@check_particular = CheckParticular.new
		@check_particulars = CheckParticular.where(check_voucher_id: @check_voucher.id)
		@check_account = CheckAccount.new
		@check_accounts = CheckAccount.where(check_voucher_id: @check_voucher.id)
	end

	def edit
		if ( current_user.role == 'Admin' )
			@check_voucher = CheckVoucher.find(params[ :id])
		else
			redirect_to check_vouchers_path
		end
		
	end

	def update
		@check_voucher = CheckVoucher.find(params[ :id])

		if @check_voucher.update_attributes(check_voucher_params)
			redirect_to check_vouchers_path
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