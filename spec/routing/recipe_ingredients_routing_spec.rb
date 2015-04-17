require "rails_helper"

RSpec.describe RecipeIngredientsController, type: :routing do
  describe "routing" do

    it "routes to #edit" do
      expect(:get => "/recipe_ingredients/1/edit").to route_to("recipe_ingredients#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/recipe_ingredients").to route_to("recipe_ingredients#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/recipe_ingredients/1").to route_to("recipe_ingredients#destroy", :id => "1")
    end

  end
end
