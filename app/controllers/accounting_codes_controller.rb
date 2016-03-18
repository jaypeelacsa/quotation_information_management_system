class AccountingCodesController < ApplicationController
	
	def index
		@accounting_codes = AccountingCode.all
	end

	def new
		@accounting_code = AccountingCode.new
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
		@accounting_code = AccountingCode.find(params[ :id])
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