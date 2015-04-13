require 'rails_helper'

RSpec.describe "recipes/edit", type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
      :user_id => 1,
      :category => "MyString",
      :timestamps => "MyString"
    ))
  end

  it "renders the edit recipe form" do
    render

    assert_select "form[action=?][method=?]", recipe_path(@recipe), "post" do

      assert_select "input#recipe_user_id[name=?]", "recipe[user_id]"

      assert_select "input#recipe_category[name=?]", "recipe[category]"

      assert_select "input#recipe_timestamps[name=?]", "recipe[timestamps]"
    end
  end
end
