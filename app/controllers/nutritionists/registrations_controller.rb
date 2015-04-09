class Nutritionists::RegistrationsController < Devise::RegistrationsController

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    
    #if update_resource(resource, account_update_params)
    if resource.update_without_current_password(account_update_params)
      yield resource if block_given?
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
        :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end


  def new
    @nutritionist = Nutritionist.new
  end


  def edit
  end


  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :image, :description, :permission, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :image, :description, :permission, :email, :password, :password_confirmation, :current_password)
    end
  end
  
end