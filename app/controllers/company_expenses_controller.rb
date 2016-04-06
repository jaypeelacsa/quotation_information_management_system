class CompanyExpensesController < ApplicationController
	
	def index
		@company_expenses = CompanyExpense.all.list_of_expenses

		if params[:start_date].present? && params[:end_date].present?
				@start_date = params[:start_date]
				@end_date = params[:end_date]
				@company_expenses = @company_expenses.where(exdate: (@start_date.to_date..@end_date.to_date))
				@check = "TRUE"
		end
	end


	def print
		if ( current_user.role == 'Admin' )
			else
				redirect_to company_expenses_path
			end
		
	end

	def print_all
		@company_expenses = CompanyExpense.all
		@company_profiles = CompanyProfile.all
		@header = "List OF All Expenses"
		if params[:start_date].present? && params[:end_date].present?
				@start_date = params[:start_date]
				@end_date = params[:end_date]
				@company_expenses = @company_expenses.where(exdate: (@start_date.to_date..@end_date.to_date))
				@check = "TRUE"
				@header = "List Of All Expenses From "+@start_date+" To "+@end_date
		end
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
			flash[:success] = "Successfully Added"
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
			flash[:success] = "Successfully Updated"
			redirect_to company_expenses_path
		else
			render "edit"
		end
	end

	def destroy
		@company_expense = CompanyExpense.find(params[ :id])
		@company_expense.destroy
		flash[:success] = "Successfully Deleted"
		redirect_to company_expenses_path
	end


	def company_expense_params
			params.require(:company_expense).permit!
	end
end