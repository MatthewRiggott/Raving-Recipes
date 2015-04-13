class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id, null: false
      t.integer :ingredient_id, null: false
      t.string :unit, null: false
      t.integer :numerator_amount, null: false
      t.integer :denominator_amount, null: false, default: 1

      t.timestamps null: false
    end

  end
end
