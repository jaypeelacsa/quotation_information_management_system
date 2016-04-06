class ReportService
	def self.excel_list_of_employee(gender_id, employed_from, employed_to)
		employees = Employee.list_of_employees

		if gender_id.present?
			employees = employees.where(gender: gender_id)
		end

		p = Axlsx::Package.new
		p.workbook do |wb|
			wb.add_worksheet do |sheet|
				title_cel = wb.styles.add_style(b: true, alignment: {horizontal: :center})
				sheet.add_row ["List Of Employee"]
				sheet.merge_cells("A1:B1:C1")

				sheet.add_row ["Firstname","Middlename","Lastname"], style: title_cel
				employees.each do |p|
					sheet.add_row [p.firstname,p.middlename,p.lastname]
				end	
			end
		end
		p
	end
end