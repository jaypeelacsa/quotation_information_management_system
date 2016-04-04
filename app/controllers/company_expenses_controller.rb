class CompanyExpensesController < ApplicationController
	
	def index
		@company_expenses = CompanyExpense.all
	end

	def new
		if ( current_user.role == 'Admin' )
				@company_expense = CompanyExpense.new
			else
				redirect_to company_expenses_path
			end
		
	end

	def create		
		@company_expense = CompanyExpense.new(company_expense_params)

		if @company_expense.save
			redirect_to company_expenses_path
		else
			render "new"
		end
	end

	def show
		@company_expense = CompanyExpense.find(params[:id])
	end

	def edit
		if ( current_user.role == 'Admin' )
				@company_expense = CompanyExpense.find(params[ :id])
			else
				redirect_to company_expenses_path
			end
		
	end

	def update
		@company_expense = CompanyExpense.find(params[ :id])

		if @company_expense.update_attributes(company_expense_params)
			redirect_to company_expenses_path
		else
			render "edit"
		end
	end

	def destroy
		@company_expense = CompanyExpense.find(params[ :id])
		@company_expense.destroy
		redirect_to company_expenses_path
	end


	def company_expense_params
			params.require(:company_expense).permit!
	end
end