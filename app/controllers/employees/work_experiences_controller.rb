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
					redirect_to employee_path(@employee)
				else
					render "new"
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
					redirect_to employee_path(@employee)
				else
					render "edit"
				end
			end

			def destroy
				@work_experience = WorkExperience.find(params[:id])
				@work_experience.destroy
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