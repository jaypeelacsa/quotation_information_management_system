module CheckVouchers
	class CheckAccountsController < ApplicationController

			before_filter :load_defaults
		
			def new
				@check_account = CheckAccount.new
			end

			def create
				@check_account = CheckAccount.new(check_account_params)
				@check_account.check_voucher = @check_voucher
				if @check_account.save
					redirect_to check_voucher_path(@check_voucher)
				else
					render "new"
				end
			end

			def edit
				@check_account = CheckAccount.find(params[:id])
			end

			def update
				@check_account = CheckAccount.find(params[:id])
				@check_account.check_voucher = @check_voucher
				if @check_account.update_attributes(check_account_params)
					redirect_to check_voucher_path(@check_voucher)
				else
					render "edit"
				end
			end

			def destroy
				@check_account = CheckAccount.find(params[:id])
				@check_particular.destroy
				redirect_to check_voucher_path(@check_voucher)
			end

			def check_account_params
				params.require(:check_account).permit!
			end

			def load_defaults
				@check_voucher = CheckVoucher.find(params[:check_voucher_id])
			end
	end
end