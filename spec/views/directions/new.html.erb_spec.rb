require 'rails_helper'

RSpec.describe "directions/new", type: :view do
  before(:each) do
    assign(:direction, Direction.new(
      :step_number => 1,
      :recipe_id => 1,
      :body => "MyString"
    ))
  end

  it "renders new direction form" do
    render

    assert_select "form[action=?][method=?]", directions_path, "post" do

      assert_select "input#direction_step_number[name=?]", "direction[step_number]"

      assert_select "input#direction_recipe_id[name=?]", "direction[recipe_id]"

      assert_select "input#direction_body[name=?]", "direction[body]"
    end
  end
end
