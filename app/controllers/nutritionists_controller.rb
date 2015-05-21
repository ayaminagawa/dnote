class NutritionistsController < ApplicationController
  def show
    @nutritionist = Nutritionist.find(params[:id])
    @columns = Column.where(:nutritionist_id => params[:id])
  end

  def index
    @nutritionists = Nutritionist.all
  end

  # def after_sign_in_path_for(resource)
  #   if params[:controller] == "nutritionists/registrations" || params[:controller] == "nutritionists/sessions"
  #      nutritionist_path(current_nutritionist)
  #     else
  #      user_path(current_user)
  #   end
   
  # end
end
