class FoodInfosController < ApplicationController
  def index
    @food_infos = FoodInfo.paginate(page: params[:page], per_page: 50)
  end

  def update_use_flag
    food_info = FoodInfo.find(params[:id])
    food_info.update(use_flag: params[:checked])
    render :nothing => true
  end
end
