class ServiceProductsController < ApplicationController
	
	def index
		@service_products = ServiceProduct.all

		if params[:name].present?
			@name = params[:name]
			@service_products = @service_products.where("lower(name) LIKE :name",name: "%#{@name}")
		end

		if params[:type].present?
			@type = params[:type]
			@service_products = @service_products.where("type = :type",type: params[:type])
		end

		if params[:code].present?
			@code = params[:code]
			@service_products = @service_products.where("code LIKE :code",code: "%#{@code}")
		end

		# if params[:price_from].present? && params[:price_to].present?
		# 	@price_from = params[:price_from]
		# 	@price_to = params[:price_to]
		# 	@service_products = @service_product.where(price: >= @price_from && price: <= @price_to )
		# end

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
		@service_product = ServiceProduct.find(params[:id])
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