class CashVouchersController < ApplicationController
	
	def index
		@cash_vouchers = CashVoucher.list_of_cash_vouchers
				if params[:name].present?
				@name = params[:name]
				@cash_vouchers = @cash_vouchers.where("lower(paid_to) LIKE :name",name: "%#{@name}")
			end

		if params[:start_date].present? && params[:end_date].present?
			@start_date = params[:start_date]
			@end_date = params[:end_date]
			@cash_vouchers = @cash_vouchers.where(cash_date: (@start_date.to_date..@end_date.to_date))
		end
	end

	def new
		if ( current_user.role == 'Admin' )
			@cash_voucher = CashVoucher.new
		else
			redirect_to cash_vouchers_path
		end
		
	end

	def create		
		@cash_voucher = CashVoucher.new(cash_voucher_params)
		if @cash_voucher.save
			flash[:success] = "Successfully Added"
			redirect_to cash_vouchers_path
		else
			render "new"
		end
	end

	def show
		@cash_voucher = CashVoucher.find(params[:id])
		@cash_particular = CashParticular.new
		@cash_particulars = CashParticular.where(cash_voucher_id: @cash_voucher.id)
	end

	def edit
		if ( current_user.role == 'Admin' )
			@cash_voucher = CashVoucher.find(params[ :id])
		else
			redirect_to cash_vouchers_path
		end
		
	end

	def update
		@cash_voucher = CashVoucher.find(params[ :id])

		if @cash_voucher.update_attributes(cash_voucher_params)
			flash[:success] = "Successfully Updated"
			redirect_to cash_vouchers_path
		else
			render "edit"
		end
	end

	def destroy
		@cash_voucher = CashVoucher.find(params[ :id])
		@cash_voucher.destroy
		flash[:success] = "Successfully Deleted"
		redirect_to cash_vouchers_path
	end

	def details
		if ( current_user.role == 'Admin' )
			@cash_voucher = CashVoucher.find(params[:id])
			@cash_particulars = CashParticular.where(cash_voucher_id: @cash_voucher.id)
		else
			redirect_to employees_path
		end
	end

	def cash_voucher_params
			params.require(:cash_voucher).permit!
	end

end