class PettyVouchersController < ApplicationController
	
	def index
		@petty_vouchers = PettyVoucher.all

		if params[:name].present?
			@name = params[:name]
			@petty_vouchers = @petty_vouchers.where("lower(payee) LIKE :name",name: "%#{@name}")
		end

		if params[:start_date].present? && params[:end_date].present?
			@start_date = params[:start_date]
			@end_date = params[:end_date]
			@petty_vouchers = @petty_vouchers.where(petty_date: (@start_date.to_date..@end_date.to_date))
		end
	end

	def new
		if ( current_user.role == 'Admin' )
			@petty_voucher = PettyVoucher.new
		else
			redirect_to petty_vouchers_path
		end
	end

	def create		
		@petty_voucher = PettyVoucher.new(petty_voucher_params)
		if @petty_voucher.save
			redirect_to petty_vouchers_path
		else
			render "new"
		end
	end

	def show
		@petty_voucher = PettyVoucher.find(params[:id])
		@petty_particular = PettyParticular.new
		@petty_particulars = PettyParticular.where(petty_voucher_id: @petty_voucher.id)
	end

	def edit
		if ( current_user.role == 'Admin' )
			@petty_voucher = PettyVoucher.find(params[ :id])
		else
			redirect_to petty_vouchers_path
		end
		
	end

	def update
		@petty_voucher = PettyVoucher.find(params[ :id])

		if @petty_voucher.update_attributes(petty_voucher_params)
			redirect_to petty_vouchers_path
		else
			render "edit"
		end
	end

	def destroy
		@petty_voucher = PettyVoucher.find(params[ :id])
		@petty_voucher.destroy
		redirect_to petty_vouchers_path
	end

	def details
		if ( current_user.role == 'Admin' )
		@petty_voucher = PettyVoucher.find(params[:id])
		@petty_particulars = PettyParticular.where(petty_voucher_id: @petty_voucher.id)
		else
			redirect_to employees_path
		end
	end

	def petty_voucher_params
			params.require(:petty_voucher).permit!
	end

end