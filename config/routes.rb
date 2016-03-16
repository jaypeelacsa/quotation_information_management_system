Rails.application.routes.draw do
  root to: "pages#index"
  resources :employees do
		resources :work_experiences, module: 'employees'
	end

	resources :petty_vouchers do
		resources :petty_particulars, module: 'petty_vouchers'
	end

	resources :billings
	
	resources :service_products
  resources :company_profiles
  resources :clients

  resources :check_vouchers
end
