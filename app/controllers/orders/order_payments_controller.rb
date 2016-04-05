module Orders
	class OrderPaymentsController < ApplicationController

			before_filter :load_defaults

			def new
				@order_payment = OrderPayment.new
			end

			def create
				@order_payment = OrderPayment.new(order_payment_params)
				@order_payment.order = @order
				if @order_payment.save
					redirect_to order_path(@order)
				else
					render "new"
				end
			end

			def edit
				if ( current_user.role == 'Admin' )
					@order_payment = OrderPayment.find(params[:id])
				else
						redirect_to order_path(@order)
				end
			end

			def update
				@order_payment = OrderPayment.find(params[:id])
				@order_payment.order = @order
				if @order_payment.update_attributes(order_payment_params)
					redirect_to order_path(@order)
				else
					render "edit"
				end
			end

			def destroy
				@order_payment = OrderPayment.find(params[:id])
				@order_payment.destroy
				redirect_to order_path(@order)
			end

			def order_payment_params
				params.require(:order_payment).permit!
			end

			def load_defaults
				@order = Order.find(params[:order_id])
			end
	end
end