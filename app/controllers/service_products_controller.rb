class ServiceProductsController < ApplicationController
	
	def index
		@service_products = ServiceProduct.all
	end

	def new
		@service_product = ServiceProduct.new
	end

	def create		
		@service_product = ServiceProduct.new(service_product_params)
		if @service_product.save
			redirect_to service_products_path
		else
			render "new"
		end
	end

	def show
		@service_product = ServiceProduct.all
	end

	def edit
		@service_product = ServiceProduct.find(params[ :id])
	end

	def update
		@service_product = ServiceProduct.find(params[ :id])

		if @service_product.update_attributes(service_product_params)
			redirect_to service_product_path(@service_product)
		else
			render "edit"
		end
	end

	def destroy
		@service_product = ServiceProduct.find(params[ :id])
		@service_product.destroy
		redirect_to service_products_path
	end


	def service_product_params
			params.require(:service_product).permit!
	end

end