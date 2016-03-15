Rails.application.routes.draw do
  root to: "pages#index"
  resources :employees
	resources :work_experiences
	resources :service_products
end
