class Users::RegistrationsController < Devise::RegistrationsController
	 before_filter :configure_permitted_parameters

  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end
   protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:name, :image, :gender, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:name, :image, :gender, :email, :password, :password_confirmation, :current_password)
      end
    end




end
