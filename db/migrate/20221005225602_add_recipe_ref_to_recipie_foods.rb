class AddRecipeRefToRecipieFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipefoods, :recipe, null: false, foreign_key: true
  end
end
