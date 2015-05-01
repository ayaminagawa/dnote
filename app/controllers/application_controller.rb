class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if params[:controller] == "nutritionists/registrations" || params[:controller] == "nutritionists/sessions"
       nutritionist_path(current_nutritionist)
      else
       user_path(current_user)
    end
   
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
     u.permit(:name, :image, :gender, :email, :password, :password_confirmation)
   end

 end
end
