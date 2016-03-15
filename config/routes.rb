Rails.application.routes.draw do
  root to: "pages#index"

  resources :company_profiles
  resources :clients
end
