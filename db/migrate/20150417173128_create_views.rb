class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.integer :recipe_id, null: false
      t.integer :user_id, null: false
    end
  end
end
