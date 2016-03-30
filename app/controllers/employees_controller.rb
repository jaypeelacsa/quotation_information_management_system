class EmployeesController < ApplicationController
		def index
			@employees= Employee.all

			if params[:name].present?
				@name = params[:name]
				@employees = @employees.where("lower(firstname) LIKE :name OR lower(lastname) LIKE :name OR lower(middlename) LIKE :name",name: "%#{@name}")
			end

			if params[:start_date].present? && params[:end_date].present?
				@start_date = params[:start_date]
				@end_date = params[:end_date]
				@employees = @employees.where(date_employed: (@start_date.to_date..@end_date.to_date))
			end

			if params[:pos].present?
				@pos = params[:pos]
				@employees = @employees.where("lower(position) LIKE :pos",pos: "%#{@pos}")
			end

			if params[:gender].present?
				@gender = params[:gender]
				@employees = @employees.where("gender = :gender",gender: params[:gender])
			end

			if params[:status].present?
				@status = params[:status]
				@employees = @employees.where("status = :status",status: params[:status])
			end

		end

		def new
			if ( current_user.role == 'Admin' )
				@employee = Employee.new
			else
				redirect_to employees_path
			end
		end

		def create
			@employee = Employee.new(employee_params)
			if @employee.save
				redirect_to employees_path
			else
				render "new"
			end
		end

		def show
			@employee = Employee.find(params[:id])
			@work_experience = WorkExperience.new
			@work_experiences = WorkExperience.where(employee_id: @employee.id)
		end

		def edit
			if ( current_user.role == 'Admin' )
				@employee = Employee.find(params[:id])
			else
				redirect_to employees_path
			end
		end

		def update
			@employee = Employee.find(params[:id])
			if @employee.update_attributes(employee_params)
				redirect_to employees_path
			else
				render "edit"
			end
		end

		def destroy
			@employee = Employee.find(params[:id])
			@employee.destroy
			redirect_to employees_path
		end

		def print

		end

		def print_all
			if ( current_user.role == 'Admin' )
				@employees= Employee.all
				@company_profiles = CompanyProfile.all

				if params[:start_date].present? && params[:end_date].present?
					@start_date = params[:start_date]
					@end_date = params[:end_date]
					@employees = @employees.where(date_employed: (@start_date.to_date..@end_date.to_date))
				end

				if params[:pos].present?
					@pos = params[:pos]
					@employees = @employees.where("lower(position) LIKE :pos",pos: "%#{@pos}")
				end

				if params[:gender].present?
					@gender = params[:gender]
					@employees = @employees.where("gender = :gender",gender: params[:gender])
				end

				if params[:status].present?
					@status = params[:status]
					@employees = @employees.where("status = :status",status: params[:status])
				end
			else
				redirect_to employees_path
			end

		end

		def details
			if ( current_user.role == 'Admin' )
				@employee = Employee.find(params[:id])
				@work_experiences = WorkExperience.where(employee_id: @employee.id)
				@company_profiles = CompanyProfile.all
			else
				redirect_to employees_path
			end
			
		end

		def employee_params
			params.require(:employee).permit!
		end

end
