require 'rails_helper'

RSpec.describe "recipe_ingredients/edit", type: :view do
  before(:each) do
    @recipe_ingredient = assign(:recipe_ingredient, RecipeIngredient.create!(
      :recipe_id => 1,
      :ingredient_id => 1,
      :unit => "MyString",
      :amount => "9.99"
    ))
  end

  it "renders the edit recipe_ingredient form" do
    render

    assert_select "form[action=?][method=?]", recipe_ingredient_path(@recipe_ingredient), "post" do

      assert_select "input#recipe_ingredient_recipe_id[name=?]", "recipe_ingredient[recipe_id]"

      assert_select "input#recipe_ingredient_ingredient_id[name=?]", "recipe_ingredient[ingredient_id]"

      assert_select "input#recipe_ingredient_unit[name=?]", "recipe_ingredient[unit]"

      assert_select "input#recipe_ingredient_amount[name=?]", "recipe_ingredient[amount]"
    end
  end
end
