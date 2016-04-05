class PagesController < ApplicationController

	def index
		unless user_signed_in?
			redirect_to new_user_session_path
		end

		@service_products = ServiceProduct.list_of_service_products.limit(5)
		
		@order_particulars = OrderParticular.all.limit(5)

		@employees = Employee.list_of_employees.limit(5)	
	end


end