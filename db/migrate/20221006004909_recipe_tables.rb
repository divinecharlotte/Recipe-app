class RecipeTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :recipefoods_tables

    create_table :recipefoods do |t|
      t.belongs_to :foods
      t.belongs_to :recipes
      t.timestamps
    end
  end
end
