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
  end

  # GET /menus/new
  def new
    @menu = Menu.new
    @menu_recipe = MenuRecipe.new(params[:main])   
    @main_recipes = Recipe.find(:all, :conditions => { :recipe_select => 1 }) 
    @side_recipes = Recipe.find(:all, :conditions => { :recipe_select => 2 })
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    # @main_recipes = Recipe.find(:all, :conditions => { :recipe_select => 1 })


    # respond_to do |format|
      
      if @menu.save
        @menu_recipe = @menu.menu_recipes.build
        # @menu_recipe.menu_id = @menu.id
        @menu_recipe.recipe_id = params[:main]

        @menu_recipe.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render action: 'show', status: :created, location: @menu }
      else
        format.html { render action: 'new' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end

    # end

    # respond_to do |format|
    #   if @main_recipe.save
    #     format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @menu }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @main_recipe.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update

  @menu_recipe = MenuRecipe.find(params[:main])
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
    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :point, :category)
    end
end
