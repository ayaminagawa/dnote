class Nutritionists::SessionsController < Devise::SessionsController
 
  def new
    super
    render :layout => "preview_layout"
  end
 
  def create
    super
    render :layout => "preview_layout"
  end
end