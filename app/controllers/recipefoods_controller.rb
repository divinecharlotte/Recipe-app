class RecipeFoodsController < ApplicationController
  before_action :set_recipe

  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = @recipe.id

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(@recipe), notice: 'recipe food was successfully added.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    recipe_food = RecipeFood.find(params[:recipe_food_id])
    @recipe_food = recipe_food.update(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(@recipe), notice: 'recipe food was successfully added.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy

    if @recipe.save
      flash[:notice] = 'Recipe food was successfully deleted.'
      redirect_to recipe_path(@recipe)
    else
      render :new, alert: 'Error can not delete deleting the recipe food'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
