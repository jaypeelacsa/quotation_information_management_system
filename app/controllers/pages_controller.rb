class PagesController < ApplicationController

	def index
		unless user_signed_in?
			redirect_to new_user_session_path
		end

		@service_products = ServiceProduct.list_of_service_products

		@services = ServiceProduct.list_of_service_products.limit(5)
		
		@order_particulars = OrderParticular.all

		@employees = Employee.list_of_employees

		@employ = Employee.list_of_employees.limit(5)

		@clients = Client.all	

		@orders = Order.all
	end
		
end