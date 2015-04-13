require 'rails_helper'

RSpec.describe "recipes/new", type: :view do
  before(:each) do
    assign(:recipe, Recipe.new(
      :user_id => 1,
      :category => "MyString",
      :timestamps => "MyString"
    ))
  end

  it "renders new recipe form" do
    render

    assert_select "form[action=?][method=?]", recipes_path, "post" do

      assert_select "input#recipe_user_id[name=?]", "recipe[user_id]"

      assert_select "input#recipe_category[name=?]", "recipe[category]"

      assert_select "input#recipe_timestamps[name=?]", "recipe[timestamps]"
    end
  end
end
