Rails.application.routes.draw do
  root to: "pages#index"
  resources :employees do
		resources :work_experiences, module: 'employees'
	end
	resources :service_products
  resources :company_profiles
  resources :clients

  resources :check_vouchers do
  	resources :check_particulars, module: 'check_vouchers'
  end
end
