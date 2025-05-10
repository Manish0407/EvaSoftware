# app/controllers/admin_users/sessions_controller.rb
class AdminUsers::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    admin_root_path # Redirect to the admin dashboard
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_user_session_path # Redirect to the admin login page
  end
end
