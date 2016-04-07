module Employees
	class WorkExperiencesController < ApplicationController

			before_filter :load_defaults

			def index
				@work_experiences = WorkExperience.all
			end

			def new
				@work_experience = WorkExperience.new
			end

			def create
				@work_experience = WorkExperience.new(work_experience_params)
				@work_experience.employee = @employee
				if @work_experience.save
					flash[:success] = "Successfully Added"
					redirect_to employee_path(@employee)
				else
					redirect_to employee_path(@employee)
				end
			end

			def show
				@employee = Employee.find(params[:id])
			end

			def edit
				@work_experience = WorkExperience.find(params[:id])
			end

			def update
				@work_experience = WorkExperience.find(params[:id])
				@work_experience.employee = @employee
				if @work_experience.update_attributes(work_experience_params)
					flash[:success] = "Successfully Updated"
					redirect_to employee_path(@employee)
				else
					render "edit"
				end
			end

			def destroy
				@work_experience = WorkExperience.find(params[:id])
				@work_experience.destroy
				flash[:success] = "Successfully Deleted"
				redirect_to employee_path(@employee)
			end

			def work_experience_params
				params.require(:work_experience).permit!
			end

			def load_defaults
				@employee = Employee.find(params[:employee_id])
			end
	end
end