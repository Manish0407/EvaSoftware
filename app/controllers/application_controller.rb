class ApplicationController < ActionController::Base
	before_action :authenticate_employee!
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_employee!

	protected

	def authenticate_admin_user!
		if admin_user_signed_in?
		  true
		else
		  redirect_to new_admin_user_session_path, notice: 'You must be logged in as an admin to access this page.'
		end
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :city, :state, :country])
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :city, :state, :country])
	end
end
