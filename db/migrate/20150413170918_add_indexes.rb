class AddIndexes < ActiveRecord::Migration
  def change
    add_index :ingredients, :name, unique: true
    add_index :directions, [:step_number, :recipe_id], unique: true
  end
end
