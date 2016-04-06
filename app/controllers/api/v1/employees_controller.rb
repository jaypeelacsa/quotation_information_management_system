module Api
	module V1
		class EmployeesController < ApplicationController
			def list
				employees = EmployeeService.list(params)
				render json: {employees: employees}
			end
		end
	end
end