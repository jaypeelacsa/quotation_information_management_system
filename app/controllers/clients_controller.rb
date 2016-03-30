class ClientsController < ApplicationController
	
	def index
		@clients = Client.all


		if params[:client_name].present?
			@client_name = params[:client_name]
			@clients = @clients.where("lower(client_name) LIKE :client_name",client_name: "%#{@client_name}")
		end

		if params[:company_name].present?
			@company_name = params[:company_name]
			@clients = @clients.where("lower(company_name) LIKE :company_name",company_name: "%#{@company_name}")
		end

		if params[:status].present?
			@status = params[:status]
			@clients = @clients.where("status = :status",status: params[:status])
		end


	end

	def new
		if ( current_user.role == 'Admin' )
				@client = Client.new
		else
				redirect_to clients_path
		end
		
	end

	def create		
		@client = Client.new(client_params)

		if @client.save
			redirect_to clients_path
		else
			render "new"
		end
	end

	def show
		@client = Client.find(params[:id])
	end

	def edit
		if ( current_user.role == 'Admin' )
				@client = Client.find(params[ :id])
		else
				redirect_to clients_path
		end
		
	end

	def update
		@client = Client.find(params[ :id])

		if @client.update_attributes(client_params)
			redirect_to client_path(@client)
		else
			render "edit"
		end
	end

	def destroy
		@client = Client.find(params[ :id])
		@client.destroy
		redirect_to clients_path
	end


	def client_params
			params.require(:client).permit!
	end

end