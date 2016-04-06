class ReportsController < ApplicationController
	def employee_list
		list_of_employee_excel = "list_of_employee.xlsx"
		report_package = ReportService::excel_list_of_employee(params[:gender_id],params[:employed_from],params[:employed_to])
		report_package.serialize "#{Rails.root}/tmp/#{list_of_employee_excel}"
		send_file "#{Rails.root}/tmp/#{list_of_employee_excel}", filename: "#{list_of_employee_excel}", type: "application/vnd.openxmlformat-officedocumant.spreadsheetml.sheet"
	end

	def employee_index

	end

	def build_list_of_employees_url
		url = report_list_print_path(gender_id: params[:gender_id],employed_from: params[:employed_from],employed_to: params[:employed_to])

		render json: {url: url}
	end
end