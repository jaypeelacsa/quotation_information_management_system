class CheckVouchersController < ApplicationController
	
	def index
		@check_vouchers = CheckVoucher.all

		if params[:name].present?
				@name = params[:name]
				@check_vouchers = @check_vouchers.where("lower(payee) LIKE :name",name: "%#{@name}")
			end

		if params[:start_date].present? && params[:end_date].present?
			@start_date = params[:start_date]
			@end_date = params[:end_date]
			@check_vouchers = @check_vouchers.where(check_date: (@start_date.to_date..@end_date.to_date))
		end
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

	def details
		if ( current_user.role == 'Admin' )
			@check_voucher = CheckVoucher.find(params[:id])
			@check_particulars = CheckParticular.where(check_voucher_id: @check_voucher.id)
			@check_accounts = CheckAccount.where(check_voucher_id: @check_voucher.id)
			@company_profiles = CompanyProfile.all
		else
			redirect_to employees_path
		end
	end

	def check_voucher_params
			params.require(:check_voucher).permit!
	end

end