class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  protected
  # def after_update_path_for(resource)
  #   users_path
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[income_id family_id])
  end
end
