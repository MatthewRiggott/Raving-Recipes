class CreateKeyWords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :noun, null: false
    end
  end
end

