class AlterTablesBetterNames < ActiveRecord::Migration
  def change
    rename_column(:recipes, :user_id, :owner_id)
    rename_table(:containers, :favorites)
  end
end
