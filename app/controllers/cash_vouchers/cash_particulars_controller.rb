module CashVouchers
	class CashParticularsController < ApplicationController

			before_filter :load_defaults

			def new
				@cash_particular = CashParticular.new
			end

			def create
				@cash_particular = CashParticular.new(cash_particular_params)
				@cash_particular.cash_voucher = @cash_voucher
				if @cash_particular.save
					redirect_to cash_voucher_path(@cash_voucher)
				else
					render "new"
				end
			end

			def edit
				@cash_particular = CashParticular.find(params[:id])
			end

			def update
				@cash_particular = CashParticular.find(params[:id])
				@cash_particular.cash_voucher = @cash_voucher
				if @cash_particular.update_attributes(cash_particular_params)
					redirect_to cash_voucher_path(@cash_voucher)
				else
					render "edit"
				end
			end

			def destroy
				@cash_particular = CashParticular.find(params[:id])
				@cash_particular.destroy
				redirect_to cash_voucher_path(@cash_voucher)
			end

			def cash_particular_params
				params.require(:cash_particular).permit!
			end

			def load_defaults
				@cash_voucher = CashVoucher.find(params[:cash_voucher_id])
			end
	end
end