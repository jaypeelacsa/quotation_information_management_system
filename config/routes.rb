Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]                                          
    as :user do
  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
  patch 'users' => 'devise/registrations#update', :as => 'user_registration'            
end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'auth/:provider/callback' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  root to: "pages#index"

  get '/employees/print', :to => 'employees#print'
  get '/employees/print_all', :to => 'employees#print_all'
  get '/employees/:id/details', :to => 'employees#details', as: "employees_details"
  
  resources :employees do
		resources :work_experiences, module: 'employees'
	end
  
  get '/petty_vouchers/:id/details', :to => 'petty_vouchers#details', as: "petty_vouchers_details"
	resources :petty_vouchers do
		resources :petty_particulars, module: 'petty_vouchers'
	end

	resources :billings do
		resources :billing_particulars, module: 'billings'
	end
	get '/cash_vouchers/:id/details', :to => 'cash_vouchers#details', as: "cash_vouchers_details"
	resources :cash_vouchers do
		resources :cash_particulars, module: 'cash_vouchers'
	end

	resources :orders do
		resources :order_particulars, module: 'orders'
	end

	resources :service_products
  resources :company_profiles
  get '/clients/:id/details', :to => 'clients#details', as: "clients_details"
  resources :clients
  resources :accounting_codes
  
  get '/proposals/:id/details', :to => 'proposals#details', as: "proposals_details"
  resources :proposals do
  	resources :software_requirements, module: 'proposals'
  	resources :software_browsers, module: 'proposals'
  	resources :costings, module: 'proposals'
  	resources :feature_lists, module: 'proposals'
  	resources :terms_conditions, module: 'proposals'
 	end

  get '/check_vouchers/:id/details', :to => 'check_vouchers#details', as: "check_vouchers_details"
  resources :check_vouchers do
  	resources :check_particulars, module: 'check_vouchers'
  	resources :check_accounts, module: 'check_vouchers'
  end

end
