require 'rails_helper'

RSpec.describe "directions/show", type: :view do
  before(:each) do
    @direction = assign(:direction, Direction.create!(
      :step_number => 1,
      :recipe_id => 2,
      :body => "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Body/)
  end
end
