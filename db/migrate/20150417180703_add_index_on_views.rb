class AddIndexOnViews < ActiveRecord::Migration
  def change
    add_index :views, [:user_id, :recipe_id], unique: true
  end
end
