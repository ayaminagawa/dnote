class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @id = params[:id]
    @menu_recipe = MenuRecipe.where(menu_id: @id)
    @main_recipe = Recipe.find(@menu_recipe.map{|menu_recipe| menu_recipe.main})
    @side1_recipe = Recipe.find(@menu_recipe.map{|menu_recipe| menu_recipe.side1})
    @side2_recipe = Recipe.find(@menu_recipe.map{|menu_recipe| menu_recipe.side2})
    @main_recipe = @main_recipe.first
    @side1_recipe = @side1_recipe.first
    @side2_recipe = @side2_recipe.first
  end

  # GET /menus/new
  def new
    @menu = Menu.new
    @menu.menu_recipes.build 
    @main_recipes = current_user.recipes.find(:all, :conditions => { :recipe_select => 1 }) 
    @side_recipes = current_user.recipes.find(:all, :conditions => { :recipe_select => 2 })
    @menu.category_selects.build
  end

  # GET /menus/1/edit
  def edit
    @main_recipes = current_user.recipes.find(:all, :conditions => { :recipe_select => 1 }) 
    @side_recipes = current_user.recipes.find(:all, :conditions => { :recipe_select => 2 })
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = current_user.menus.build(menu_params)
    @main_recipes = Recipe.find(:all, :conditions => { :recipe_select => 1 }) 
    @side_recipes = Recipe.find(:all, :conditions => { :recipe_select => 2 })
    # respond_to do |format|
    
    if @menu.save
        # @menu_recipe.menu_id = @menu.id
        redirect_to(menu_path(@menu))
      else
        render 'new'
      end
    end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  
  def destroy
    @menu.destroy
    redirect_to root_url
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :point, :category, :image, category_selects_attributes: [:category_number2, :category_number3, :category_number4, :category_number5, :category_number6], menu_recipes_attributes: [:main, :side1, :side2])
    end
  end
