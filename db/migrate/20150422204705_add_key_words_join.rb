class AddKeyWordsJoin < ActiveRecord::Migration
  def change
    create_table :keyword_joins do |t|
      t.integer :keyword_id, null: false
      t.integer :ingredient_id, null: false
    end
  end
end

