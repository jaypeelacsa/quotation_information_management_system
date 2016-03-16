class PettyVouchersController < ApplicationController
	
	def index
		@petty_vouchers = PettyVoucher.all
	end

	def new
		@petty_voucher = PettyVoucher.new
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
		@petty_voucher = PettyVoucher.find(params[ :id])
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


	def petty_voucher_params
			params.require(:petty_voucher).permit!
	end

end