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
	
	resources :service_products
  resources :company_profiles
  resources :clients

  resources :check_vouchers
end
