class CreateContainer < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.integer :user_id, null: false
      t.integer :recipe_id, null: false
    end
  end
end
