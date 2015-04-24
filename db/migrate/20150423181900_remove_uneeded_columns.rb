class RemoveUneededColumns < ActiveRecord::Migration
  def change
    remove_column :keywords, :keyword_join_id, :integer
    remove_column :recipes, :description, :string
  end
end
