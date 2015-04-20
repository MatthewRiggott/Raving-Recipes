# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
REGIONS = [
  "chinese",
  "thai",
  "japanese",
  "filipino",
  "korean",
  "vietnamese",
  "malaysian",
  "pakistani",
  "indonesian",
  "iranian",
  "bangladeshi",
  "indian",

  "african_main",
  "moroccan",
  "south_african",
  "egyptian",

  "australian",

  "canadian",

  "italian",
  "uk",
  "french",
  "greek",
  "eastern_european",
  "german",
  "scandinavian",
  "spanish",
  "portuguese",
  "dutch",
  "austrian",
  "swiss",
  "belgian",

  "mexican",
  "caribbean",
  "south_american",

  "lebanese",
  "turkish",
  "israeli"
]
COURSES = [
  "appetizer", "bread",
  "breakfast", "dessert",
  "drink", "fruit",
  "herbs", "main",
  "salad", "soup",
  "meat", "pasta",
  "seafood", "wholegrains"
]
recipes = Allrecipes.new

binding.pry
REGIONS.each do |local|
  (1..20).each do |page_number|
    r = recipes.region(local, { limit: 10, page: page_number})
    if r != nil && r != []
    r.each do |recipe|
      cook = 0
      prep = 0
      cook = recipe[:cook_time] if recipe[:cook_time] != nil
      prep = recipe[:prep_time] if recipe[:prep_time] != nil
      cur_recipe = Recipe.create(
        name: recipe[:name],
        description: "This is a Description, This is a Description",
        image_url: recipe[:image],
        country: local,
        prep_time: cook + prep,
        category: "main",
        owner_id: 2
        )

      if cur_recipe.save
        recipe[:ingredients].each do |ing|
          i = Ingredient.find_or_create_by(name: ing[:name])
          if ing[:unit] == nil
            unit = "unit"
            top = ing[:quantity]
            bottom = 1
          elsif ing[:unit].index("/") && /(\d+)\//.match(ing[:unit]).to_i != nil
            top = /(\d+)\//.match(ing[:unit]).to_i
            bottom = /\/(\d+)/.match(ing[:unit]) .to_i
            unit = "unit"
          else
            unit = ing[:unit]
            top = ing[:quantity]
            bottom = 1
          end

          RecipeIngredient.create(
            ingredient: i,
            recipe: cur_recipe,
            numerator_amount: top,
            denominator_amount: bottom,
            unit: unit
          )
        end

        recipe[:directions].each_with_index do |step, index|
          Direction.create(
            recipe: cur_recipe,
            body: step,
            step_number: index + 1
          )
        end

      end
    end
  end
  sleep(5)
  end
end

MEASURE_UNITS = [
  "dash",
  "pinch",
  "teaspoon",
  "tablespoon",
  "fluid ounce",
  "gill",
  "cup",
  "pint",
  "quart",
  "gallon",
  "milliliter",
  "liter",
  "pound",
  "ounce",
  "milligram",
  "gram",
  "kilogram"
]
