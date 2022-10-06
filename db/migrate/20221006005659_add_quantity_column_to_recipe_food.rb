class AddQuantityColumnToRecipeFood < ActiveRecord::Migration[7.0]
  def change
    drop_table :recipefoods
    
    create_table :recipefoods do |t|
      t.belongs_to :foods
      t.belongs_to :recipes
      t.integer :quantity
      t.timestamps
    end

    add_reference :recipefoods, :recipe, null: false, foreign_key: true
    add_reference :recipefoods, :food, null: false, foreign_key: true
  end
end
