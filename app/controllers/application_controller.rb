class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  protected

  # def after_sign_in_path_for(resource)
  #   current_user_path
  # end

  # def devise_parameter_sanitizer
  #   if resource_class == User
  #     User::ParameterSanitizer.new(User, :user, params)
  #   else
  #     super # Use the default one
  #   end
  # end

end

