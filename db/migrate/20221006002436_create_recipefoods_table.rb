class CreateRecipefoodsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :recipefoods_tables do |t|
        t.belongs_to :foods
        t.belongs_to :recipes
        t.timestamps
    end
  end
end
