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
  "african",
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
  # "appetizer",
  # "bread",
  # "breakfast",
  # "dessert", #-------
  "drink",
  "fruit",
  "herbs",
  "main",
  "salad",
  "soup",
  "meat",
  "pasta",
  "seafood"
]
recipes = Allrecipes.new

binding.pry
begin
  COURSES.each do |food_type|
    (1..50).each do |page_number|

      this_recipe = recipes.course(food_type, { limit: 5, page: page_number})
      if this_recipe != nil && this_recipe != []
      this_recipe.each do |recipe|
        cook = 0
        prep = 0
        cook = recipe[:cook_time] if recipe[:cook_time] != nil
        prep = recipe[:prep_time] if recipe[:prep_time] != nil
        if Recipe.find_by(name: recipe[:name]) == nil
          cur_recipe = Recipe.create(
            name: recipe[:name],
            description: "This is a Description, This is a Description",
            image_url: recipe[:image],
            country: "US",
            prep_time: cook + prep,
            category: food_type,
            owner_id: 42
          )
        else
          cur_recipe = Recipe.find_by(name: recipe[:name])
          cur_recipe.update(category: food_type)
        end

        if cur_recipe.save
          puts "recipe saved - id#{cur_recipe.id}"
          recipe[:ingredients].each do |ing|

            if ing[:description] == nil
              unit = "1 unit"
            else
              unit = ing[:description].text
            end

            recipe_ingredient = RecipeIngredient.new(
              recipe: cur_recipe,
              unit_amount: unit
            )
            recipe_ingredient.name = ing[:name]
            recipe_ingredient.save
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
    puts "Next Recipes"
    sleep(4)
    end
  end
  ensure
end
