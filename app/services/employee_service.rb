class EmployeeService
	def self.list(params)
		data = []

		employees = Employee.all

		if params[:gender_id].present?
			employees = employees.where("gender = :gender_id",gender_id: params[:gender_id])
		end

		employees.each do |p|
			d = {}
			d[:firstname] = p.firstname
			d[:middlename] = p.middlename
			d[:lastname] = p.lastname
			d[:gender] = p.gender
			d[:date_employed] = p.date_employed

			# d[:modelname] = {}
			# d[:modelname] [:fields]

			data << d
		end
		return data
	end
end