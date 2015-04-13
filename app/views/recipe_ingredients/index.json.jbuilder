json.array!(@recipe_ingredients) do |recipe_ingredient|
  json.extract! recipe_ingredient, :id, :recipe_id, :ingredient_id, :unit, :amount
  json.url recipe_ingredient_url(recipe_ingredient, format: :json)
end
