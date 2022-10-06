class AddQuantityColumnToRecipefood < ActiveRecord::Migration[7.0]
  def change
    drop_table :recipefoods
    
    create_table :recipefoods do |t|
      t.belongs_to :foods
      t.belongs_to :recipes
      t.integer :quantity
      t.timestamps
    end
  end
end
