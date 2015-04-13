class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.integer :step_number, null: false
      t.integer :recipe_id, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
  end

end
