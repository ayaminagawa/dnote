class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    # @recipes = Recipe.all
    @recipes = Recipe.search(params[:search])
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

  def hospitalities
    @hospitalities = Recipe.find(:all, :conditions => { :kind => 10 }) 
  end

  def snacks
    @snacks = Recipe.find(:all, :conditions => { :kind => 11 }) 
  end

  def pans
    @pans = Recipe.find(:all, :conditions => { :kind => 12 }) 
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
    @ingredients = Ingredient.find(:all, :conditions => { :recipe_id => params[:id]})
    @procedures = Procedure.find(:all, :conditions => { :recipe_id => params[:id]})
    @recommended_recipe = Recipe.find(:last)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    3.times{@recipe.ingredients.build}
    4.times{@recipe.procedures.build}
    4.times{@recipe.category_selects.build}
    # @ingredient = Ingredient.new
    # @category_select = CategorySelect.new(params[:category])  
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    # @recipe = Recipe.new(recipe_params)
    @recipe = current_user.recipes.build(recipe_params)
    # @recipe.ingredients.build
    # @category_select = @recipe.category_select.build(params[:category])

    if @recipe.save
      # @ingredient = @recipe.ingredients.build
      # # @menu_recipe.menu_id = @menu.id
      # # @menu_recipe.recipe_id = params[:main]
      # @category_select.save

      # @ingredient.save
      redirect_to(recipe_path(@recipe))
    else
      render 'new'
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
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :tip, :image, :calorie, :kind, category_selects_attributes: [:category_number2, :apply2, :category_number3, :apply3, :category_number4, :apply4, :category_number5, :apply5], ingredients_attributes: [:name, :volume], procedures_attributes: [:body, :image])
    end

    # def ingredient_params
    #   params.require(:ingredient).permit(:name, :volume)
    # end
    def correct_user
      @Recipe = Recipe.find_by(id: params[:id])
      redirect_to root_url unless current_user?(@recipe.user)
    end
end
