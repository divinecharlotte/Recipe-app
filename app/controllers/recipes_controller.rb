class RecipesController < ApplicationController
  def index
    return if current_user.nil?

    @current_user = current_user
    @recipes = @current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
    @inventories = Inventory.all
  end

  def public
    @recipes = Recipe.where(public: true)
  end

  def new
    @user = current_user

    recipe = Recipe.new
    respond_to do |format|
      format.html { render :new, locals: { recipe: } }
    end
  end

  def create
    @user = current_user
    @recipe = Recipe.new(recipe_params)
    @recipe.user = @user
    if @recipe.save
      flash[:notice] = 'recipe was saved successfully'
      redirect_to recipes_path
    else
      flash.now[:notice] = 'Error:recipe could not be saved'
      render :new, locals: { recipe: @recipe }
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    user = current_user
    recipe.destroy
    if user.save
      flash[:notice] = 'Recipe was successfully deleted.'
      redirect_to recipes_path
    else
      render :new, alert: 'Error can not delete deleting the recipe'
    end
  end

  private

  def recipe_params
    params.permit(:name, :description, :cooking_time, :preparation_time, :public)
  end
end
