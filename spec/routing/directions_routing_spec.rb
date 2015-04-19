require "rails_helper"

RSpec.describe DirectionsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/directions").to route_to("directions#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/directions/1").to route_to("directions#destroy", :id => "1")
    end

  end
end
