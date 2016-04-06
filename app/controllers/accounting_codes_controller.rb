class AccountingCodesController < ApplicationController
	
	def index
		@accounting_codes = AccountingCode.list_of_accounting_codes

		if params[:code].present?
				@code = params[:code]
				@accounting_codes = @accounting_codes.where("code LIKE :code",code: "%#{@code}").list_of_accounting_codes
			end
	end

	def show
			@accounting_code = AccountingCode.find(params[ :id])
			@check_accounts = CheckAccount.where(accounting_code_id: @accounting_code.id)
			@check_vouchers = CheckVoucher.where(accounting_code_id: @accounting_code.id)
	end

	def new
		if ( current_user.role == 'Admin' )
				@accounting_code = AccountingCode.new
		else
			redirect_to accounting_codes_path
		end
	end

	def create		
		@accounting_code = AccountingCode.new(accounting_code_params)

		if @accounting_code.save 
			redirect_to accounting_codes_path 
		else
			render "new"
		end
	end

	def edit
		if ( current_user.role == 'Admin' )
			@accounting_code = AccountingCode.find(params[ :id])
		else
			redirect_to accounting_codes_path
		end
		
	end

	def update
		@accounting_code = AccountingCode.find(params[ :id])

		if @accounting_code.update_attributes(accounting_code_params)
			redirect_to accounting_code_path(@accounting_code)
		else
			render "edit"
		end
	end

	def destroy
		@accounting_code = AccountingCode.find(params[ :id])
		@accounting_code.destroy
		redirect_to accounting_codes_path
	end


	def accounting_code_params
			params.require(:accounting_code).permit!
	end

end