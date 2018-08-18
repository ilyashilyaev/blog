class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  respond_to :html, :js, :json

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

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

