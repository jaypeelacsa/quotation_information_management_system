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
