class AddIndexToContainer < ActiveRecord::Migration
  def change
    add_index :containers, [:user_id, :recipe_id], unique: true
  end
end
