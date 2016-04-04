module Orders
	class OrderParticularsController < ApplicationController

			before_filter :load_defaults

			def new
				@order_particular = OrderParticular.new
			end

			def create
				@order_particular = OrderParticular.new(order_particular_params)
				@order_particular.order = @order
				if @order_particular.save
					redirect_to order_path(@order)
				else
					render "new"
				end
			end
			
			def approve
				@order_particular = OrderParticular.find(params[:id])
				if @order_particular.status == "pending"
					@order_particular.update!(status: "approved")
				elsif @order_particular.status == "approved"
					@order_particular.update!(status: "finish")
				end
				redirect_to order_path(@order)
			end

			def edit
				if ( current_user.role == 'Admin' )
					@order_particular = OrderParticular.find(params[:id])
				else
						redirect_to orders_path
				end
				
			end

			def update
				@order_particular = OrderParticular.find(params[:id])
				@order_particular.order = @order
				if @order_particular.update_attributes(order_particular_params)
					redirect_to order_path(@order)
				else
					render "edit"
				end
			end

			def destroy
				@order_particular = OrderParticular.find(params[:id])
				@order_particular.destroy
				redirect_to order_path(@order)
			end

			def order_particular_params
				params.require(:order_particular).permit!
			end

			# def status_params
			# 	params.require(:status).permit!
			# end

			def load_defaults
				@order = Order.find(params[:order_id])
			end
	end
end