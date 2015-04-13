require 'rails_helper'

RSpec.describe "directions/edit", type: :view do
  before(:each) do
    @direction = assign(:direction, Direction.create!(
      :step_number => 1,
      :recipe_id => 1,
      :body => "MyString"
    ))
  end

  it "renders the edit direction form" do
    render

    assert_select "form[action=?][method=?]", direction_path(@direction), "post" do

      assert_select "input#direction_step_number[name=?]", "direction[step_number]"

      assert_select "input#direction_recipe_id[name=?]", "direction[recipe_id]"

      assert_select "input#direction_body[name=?]", "direction[body]"
    end
  end
end
