require 'rails_helper'

RSpec.describe "recipe_ingredients/show", type: :view do
  before(:each) do
    @recipe_ingredient = assign(:recipe_ingredient, RecipeIngredient.create!(
      :recipe_id => 1,
      :ingredient_id => 2,
      :unit => "Unit",
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(/9.99/)
  end
end
