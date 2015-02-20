class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
    
    @menus = Menu.all

  end

  def vagetables
    @vagetables = Recipe.find(:all, :conditions => { :kind => 1 }) 
    # @user = @vagetables.user(@vagetables.user_id)
  end

  def meets
    @meets = Recipe.find(:all, :conditions => { :kind => 2 }) 
  end

  def fishes
    @fishes = Recipe.find(:all, :conditions => { :kind => 3 }) 
  end

  def rices
    @rices = Recipe.find(:all, :conditions => { :kind => 4 }) 
  end

  def pastas
    @pastas = Recipe.find(:all, :conditions => { :kind => 5 }) 
  end

  def noodles
    @noodles = Recipe.find(:all, :conditions => { :kind => 6 }) 
  end

  def salads
    @salads = Recipe.find(:all, :conditions => { :kind => 7 }) 
  end

  def soups
    @soups = Recipe.find(:all, :conditions => { :kind => 8 }) 
  end

  def boxes
    @boxes = Recipe.find(:all, :conditions => { :kind => 9 }) 
  end

  def calories
    @calories = Recipe.find(:all, :conditions => { :category => 1 }) 
    @menu_calories = Menu.find(:all, :conditions => { :category => 1 }) 
  end

  def sugars
    @sugars = Recipe.find(:all, :conditions => { :category => 2 }) 
    @menu_sugars = Menu.find(:all, :conditions => { :category => 2 }) 
  end

  def stabilities
    @stabilities = Recipe.find(:all, :conditions => { :category => 3 }) 
    @menu_stabilities = Menu.find(:all, :conditions => { :category => 3 }) 
  end

  def goodtastes
    @goodtastes = Recipe.find(:all, :conditions => { :category => 4 }) 
    @menu_goodtastes = Menu.find(:all, :conditions => { :category => 4 }) 
  end

  def easies
    @easies = Recipe.find(:all, :conditions => { :category => 5 }) 
    @menu_easies = Menu.find(:all, :conditions => { :category => 5 }) 
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @made_reports = MadeReport.find(:all, :conditions => { :recipe_id => params[:id] }) 
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    # @recipe = Recipe.new(recipe_params)
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :tip, :calorie, :kind, :recipe_select, :category)
    end
end
