class CashVouchersController < ApplicationController
	
	def index
		@cash_vouchers = CashVoucher.all
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
			redirect_to cash_vouchers_path
		else
			render "edit"
		end
	end

	def destroy
		@cash_voucher = CashVoucher.find(params[ :id])
		@cash_voucher.destroy
		redirect_to cash_vouchers_path
	end

	def cash_voucher_params
			params.require(:cash_voucher).permit!
	end

end