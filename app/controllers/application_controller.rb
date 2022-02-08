class ApplicationController < ActionController::Base
  include ErrorHandling

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(_resource)
    root_path
  end

  def after_sign_in_path_for(_resource)
    root_path
    # user_path(resource)
  end



  protected

  def configure_permitted_parameters
    added_attrs = %i[username name email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: %i[login password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
