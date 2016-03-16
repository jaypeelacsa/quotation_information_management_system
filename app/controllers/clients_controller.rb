class ClientsController < ApplicationController
	
	def index
		@clients = Client.all
	end

	def new
		@client = Client.new
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
		@client = Client.all
	end

	def edit
		@client = Client.find(params[ :id])
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