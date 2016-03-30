Rails.application.routes.draw do
  devise_for :users
  
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
  

	resources :petty_vouchers do
		resources :petty_particulars, module: 'petty_vouchers'
	end

	resources :billings do
		resources :billing_particulars, module: 'billings'
	end
	
	resources :cash_vouchers do
		resources :cash_particulars, module: 'cash_vouchers'
	end

	resources :orders do
		resources :order_particulars, module: 'orders'
	end

	resources :service_products
  resources :company_profiles
  resources :clients
  resources :accounting_codes

  resources :proposals do
  	resources :software_requirements, module: 'proposals'
  	resources :software_browsers, module: 'proposals'
  	resources :costings, module: 'proposals'
  	resources :feature_lists, module: 'proposals'
  	resources :terms_conditions, module: 'proposals'
 	end


  resources :check_vouchers do
  	resources :check_particulars, module: 'check_vouchers'
  	resources :check_accounts, module: 'check_vouchers'
  end

end
