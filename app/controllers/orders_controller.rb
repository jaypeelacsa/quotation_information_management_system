class OrdersController < ApplicationController
		def index
			@orders= Order.list_of_orders

			if !params[:client_id].blank?
				@client = Client.find(params[:client_id])
				@orders = @orders.where(client_id: @client.id)
			end
		end

		def new
			if ( current_user.role == 'Admin' )
					@order = Order.new
			else
					redirect_to orders_path
			end
			
		end

		def create
			@order = Order.new(order_params)
			if @order.save
				redirect_to orders_path
			else
				render "new"
			end
		end

		def show
			@order = Order.find(params[:id])
			@order_particular = OrderParticular.new
			@order_particulars = OrderParticular.where(order_id: @order.id)
		end

		def edit
			if ( current_user.role == 'Admin' )
					@order = Order.find(params[:id])
			else
					redirect_to orders_path
			end
			
		end

		def update
			@order = Order.find(params[:id])
			if @order.update_attributes(order_params)
				redirect_to  orders_path
			else
				render "edit"
			end
		end

		def destroy
			@order = Order.find(params[:id])
			@order.destroy
			redirect_to  orders_path
		end

		def order_params
			params.require(:order).permit!
		end
end
