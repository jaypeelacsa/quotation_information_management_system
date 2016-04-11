class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        # Fields for sign up
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :middlename, :lastname, :role, :username, :email, :password) }
        # Fields for editing an existing account
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :middlename, :lastname, :username, :email, :password, :password_confirmation, :current_password) }
    end

    layout :layout_by_resource
    
    def layout_by_resource
      if devise_controller?
        "loginpage"
      elsif params[:controller] == "employees" && ["details"].include?(params[:action])
        "printing"
      elsif params[:controller] == "employees" && ["print_all"].include?(params[:action])
        "printing"
      elsif params[:controller] == "petty_vouchers" && ["details"].include?(params[:action])
        "printing"
      elsif params[:controller] == "check_vouchers" && ["details"].include?(params[:action])
        "printing"
      elsif params[:controller] == "cash_vouchers" && ["details"].include?(params[:action])
        "printing"
      elsif params[:controller] == "proposals" && ["details"].include?(params[:action])
        "printing"
      elsif params[:controller] == "clients" && ["details"].include?(params[:action])
        "printing"
      elsif params[:controller] == "billings" && ["details"].include?(params[:action])
        "printing"
      elsif params[:controller] == "service_products" && ["print_all"].include?(params[:action])
        "printing"
      elsif params[:controller] == "clients" && ["print_all"].include?(params[:action])
        "printing"
      elsif params[:controller] == "billings" && ["print_all"].include?(params[:action])
        "printing"
      elsif params[:controller] == "company_expenses" && ["print_all"].include?(params[:action])
        "printing"
      elsif params[:controller] == "orders/order_payments" && ["print"].include?(params[:action])
        "printing"
      else
        "application"
      end
    end

    def authenticate_active_admin_user!
       authenticate_user!
       unless current_user.role?(:admin)
          # flash[:alert] = You are not authorized to access this resource!
          redirect_to root_path
       end
    end
end
