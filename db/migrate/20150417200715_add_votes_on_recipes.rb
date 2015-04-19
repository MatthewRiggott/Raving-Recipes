class AddVotesOnRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :vote_count, :integer, default: 0
  end
end
