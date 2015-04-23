class AddIndexOnKeyWords < ActiveRecord::Migration
  def change
    add_index :keywords, :noun
  end
end
