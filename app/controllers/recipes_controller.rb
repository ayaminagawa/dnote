class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    # @recipes = Recipe.all
    @recipes = Recipe.search(params[:search])
    @menus = Menu.all 
  end

  def recipe_kinds
    @recipe_kinds = params[:r_kind]
    @kinds = Recipe.where(:kind => @recipe_kinds)
  end

  def calories
    # @calories = Recipe.find(:all, :conditions => { :category => 1 }) 
    # @menu_calories = Menu.find(:all, :conditions => { :category => 1 }) 
    @calories = Recipe.where.not(calorie: nil)
  end

  def sugars
    @category_selects = CategorySelect.find(:all, :conditions => { :category_number2 => 1, :menu_id => nil})
    @sugars = @category_selects.map{|category_select| category_select.recipe}
    # @sugars = Recipe.find(:all, :conditions => { :category => 2 }) 
    # @menu_sugars = Menu.find(:all, :conditions => { :category => 2 }) 
    @category_menu_selects = CategorySelect.find(:all, :conditions => { :category_number2 => 1, :recipe_id => nil})
    @menu_sugars = @category_menu_selects.map{|category_select| category_select.menu}
  end

  def stabilities
    @category_selects = CategorySelect.find(:all, :conditions => { :category_number3 => 1, :menu_id => nil})
    @stabilities = @category_selects.map{|category_select| category_select.recipe}
    # @menu_stabilities = Menu.find(:all, :conditions => { :category => 3 }) 
    @category_menu_selects = CategorySelect.find(:all, :conditions => { :category_number3 => 1, :recipe_id => nil})
    @menu_stabilities = @category_menu_selects.map{|category_select| category_select.menu}
   
  end

  def goodtastes
    @category_selects = CategorySelect.find(:all, :conditions => { :category_number4 => 1, :menu_id => nil})
    @goodtastes = @category_selects.map{|category_select| category_select.recipe}
    # @menu_goodtastes = Menu.find(:all, :conditions => { :category => 4 }) 
    @category_menu_selects = CategorySelect.find(:all, :conditions => { :category_number4 => 1, :recipe_id => nil})
    @menu_goodtastes = @category_menu_selects.map{|category_select| category_select.menu}
    
  end

  def easies
    @category_selects = CategorySelect.find(:all, :conditions => { :category_number5 => 1, :menu_id => nil})
    @easies = @category_selects.map{|category_select| category_select.recipe}
    # @menu_easies = Menu.find(:all, :conditions => { :category => 5 }) 
    @category_menu_selects = CategorySelect.find(:all, :conditions => { :category_number5 => 1, :recipe_id => nil})
    @menu_easies = @category_menu_selects.map{|category_select| category_select.menu}
    
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
    @recipe.category_selects.build
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
    redirect_to '/about'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :recipe_select, :tip, :image, :calorie, :kind, category_selects_attributes: [:id, :category_number2, :category_number3, :category_number4, :category_number5], ingredients_attributes: [:id, :name, :volume], procedures_attributes: [:id, :body, :image])
    end

    # def ingredient_params
    #   params.require(:ingredient).permit(:name, :volume)
    # end
    def correct_user
      @Recipe = Recipe.find_by(id: params[:id])
      redirect_to root_url unless current_user?(@recipe.user)
    end
end
