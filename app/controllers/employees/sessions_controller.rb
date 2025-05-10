# frozen_string_literal: true

class Employees::SessionsController < Devise::SessionsController
  def create
    self.resource = resource_class.new(sign_in_params)

    # Check if email is present
    if sign_in_params[:email].blank?
      resource.errors.add(:email, "Email is required")
    end

    # Check if password is present
    if sign_in_params[:password].blank?
      resource.errors.add(:password, "Password is required")
    end

    # If there are no errors, proceed with authentication
    if resource.errors.empty?
      employee = resource_class.find_by(email: sign_in_params[:email])

      if employee.nil?
        resource.errors.add(:email, "Invalid email") # Email not found
      elsif !employee.valid_password?(sign_in_params[:password])
        resource.errors.add(:password, "Invalid password") # Incorrect password
      else
        # If login is successful
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, employee)
        respond_with employee, location: after_sign_in_path_for(employee)
        return
      end
    end

    # If there are errors, render the login form again
    flash.now[:alert] = resource.errors.full_messages.join(", ") if resource.errors.any?
    render :new
  end

  private

  def sign_in_params
    params.require(resource_name).permit(:email, :password, :remember_me)
  rescue ActionController::ParameterMissing
    {} # Return an empty hash if `employee` is missing
  end
end
