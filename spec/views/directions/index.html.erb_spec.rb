require 'rails_helper'

RSpec.describe "directions/index", type: :view do
  before(:each) do
    assign(:directions, [
      Direction.create!(
        :step_number => 1,
        :recipe_id => 2,
        :body => "Body"
      ),
      Direction.create!(
        :step_number => 1,
        :recipe_id => 2,
        :body => "Body"
      )
    ])
  end

  it "renders a list of directions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
