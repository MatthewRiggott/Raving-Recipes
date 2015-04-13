require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Recipe.create!(
        :user_id => 1,
        :category => "Category",
        :timestamps => "Timestamps"
      ),
      Recipe.create!(
        :user_id => 1,
        :category => "Category",
        :timestamps => "Timestamps"
      )
    ])
  end

  it "renders a list of recipes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Timestamps".to_s, :count => 2
  end
end
