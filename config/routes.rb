Rails.application.routes.draw do
  root to: "pages#index"
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
 	end


  resources :check_vouchers do
  	resources :check_particulars, module: 'check_vouchers'
  	resources :check_accounts, module: 'check_vouchers'
  end
  
end
