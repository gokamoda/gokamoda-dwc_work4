class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def index
    flash[:notice] = "aaaa" unless user_signed_in?
  end
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end

  protected
  
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end
end
