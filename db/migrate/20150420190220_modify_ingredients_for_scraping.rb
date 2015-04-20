class ModifyIngredientsForScraping < ActiveRecord::Migration
  def change
    remove_column :recipe_ingredients, :unit, :string
    remove_column :recipe_ingredients, :numerator_amount, :integer
    remove_column :recipe_ingredients, :denominator_amount, :integer
    add_column :recipe_ingredients, :unit_amount, :string, null: false
  end
end
