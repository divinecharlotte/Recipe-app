class RecipeFoodsController < ApplicationController
    def new
        @recipe_food = RecipeFood.new
        @recipe = Recipe.find(params[:recipe_id])
        @foods = Food.all
    end
    
    def create
        @recipe = Recipe.find(params[:recipe_id])
        @recipe_food = @recipe.recipe_foods.create(recipe_food_params)
        if @recipe_food.save
          flash[:notice] = 'Ingredient added successfully.'
          redirect_to @recipe
        else
          render :new
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

        flash[:notice] = 'Recipe food was successfully deleted.'
        redirect_to recipe_path(@recipe_food.recipe_id)
    end
    
    private
    
    def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
    end
    
    def recipe_food_params
        params.require(:recipe_food).permit(:quantity, :food_id)
    end
    
      
end
