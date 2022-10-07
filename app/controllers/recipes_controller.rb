class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    return if current_user.nil?

    @current_user = current_user
    @recipes = @current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def public
    @recipes = Recipe.where(public: true)
  end

  def new
    @user = current_user
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
    # recipe = Recipe.find(params[:id])
    # user = current_user
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.permit(:name, :description, :cooking_time, :preparation_time, :public)
  end
end
