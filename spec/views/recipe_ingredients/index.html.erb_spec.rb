require 'rails_helper'

RSpec.describe "recipe_ingredients/index", type: :view do
  before(:each) do
    assign(:recipe_ingredients, [
      RecipeIngredient.create!(
        :recipe_id => 1,
        :ingredient_id => 2,
        :unit => "Unit",
        :amount => "9.99"
      ),
      RecipeIngredient.create!(
        :recipe_id => 1,
        :ingredient_id => 2,
        :unit => "Unit",
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of recipe_ingredients" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
