class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :user_id, null: false
      t.string :category, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :prep_time, null: false
      t.integer :rating_count, null: false, default: 0
      t.integer :rating_total, null: false, default: 0
      t.string :country, null: false
      t.string :image_url, null: false

      t.timestamps null: false
    end
  end
end
