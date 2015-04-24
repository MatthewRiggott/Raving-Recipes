require 'csv'
# *** Must clone allrecipes gem from https://github.com/MatthewRiggott/allrecipes and ****
# *** set gem 'allrecipes', path: "/path to cloned gem" in your gem file to scrape with this gem ***

# REGIONS = [
#   "chinese",
#   "thai",
#   "japanese",
#   "filipino",
#   "korean",
#   "vietnamese",
#   "malaysian",
#   "pakistani",
#   "indonesian",
#   "iranian",
#   "bangladeshi",
#   "indian",
#   "african",
#   "canadian",
#   "italian",
#   "uk",
#   "french",
#   "greek",
#   "eastern_european",
#   "german",
#   "scandinavian",
#   "spanish",
#   "portuguese",
#   "dutch",
#   "austrian",
#   "swiss",
#   "belgian",
#   "mexican",
#   "caribbean",
#   "south_american",
#   "lebanese",
#   "turkish",
#   "israeli"
# ]

# COURSES = [
#   # "appetizer",
#   # "bread",
#   # "breakfast",
#   # "dessert", #---broke
#   # "drink",
#   # "fruit",
#   # "herbs",
#   "main" #---250
#   # "salad",
#   # "soup",
#   # "meat",
#   # "pasta",
#   # "seafood"
# ]

#  ********* scrape allrecipes by course *********
#  ********* can scrape by region as well ********
#  ********* turn sleep off!! *******************

# recipes = Allrecipes.new
# begin
#   COURSES.each do |food_type|
#     (251..400).each do |page_number|

#       this_recipe = recipes.course(food_type, { limit: 5, page: page_number})
#       if this_recipe != nil && this_recipe != []
#       this_recipe.each do |recipe|
#         cook = 0
#         prep = 0
#         cook = recipe[:cook_time] if recipe[:cook_time] != nil
#         prep = recipe[:prep_time] if recipe[:prep_time] != nil
#         if Recipe.find_by(name: recipe[:name]) == nil
#           cur_recipe = Recipe.create(
#             name: recipe[:name],
#             description: "This is a Description, This is a Description",
#             image_url: recipe[:image],
#             country: "US",
#             prep_time: cook + prep,
#             category: food_type,
#             owner_id: 42
#           )
#         else
#           cur_recipe = Recipe.find_by(name: recipe[:name])
#           cur_recipe.update(category: food_type)
#         end

#         if cur_recipe.save
#           puts "recipe saved - id#{cur_recipe.id}"
#           recipe[:ingredients].each do |ing|

#             if ing[:description] == nil
#               unit = "1 unit"
#             else
#               unit = ing[:description].text
#             end

#             recipe_ingredient = RecipeIngredient.new(
#               recipe: cur_recipe,
#               unit_amount: unit
#             )
#             recipe_ingredient.name = ing[:name]
#             recipe_ingredient.save
#           end

#           recipe[:directions].each_with_index do |step, index|
#             Direction.create(
#               recipe: cur_recipe,
#               body: step,
#               step_number: index + 1
#             )

#           end
#         end
#       end
#     end
#     puts "Next Recipes"
#     sleep(5)
#     end
#   end
#   ensure
# end

# ********* read the active record to csv *********
# CSV.open("ingredients.csv", "wb") do |csv|
#   csv << Ingredient.attribute_names
#   Ingredient.all.each do |ingredient|
#     csv << [ingredient.name, ingredient.id]
#   end
# end

# ********* read the keywords csv back into activerecord ***********
# CSV.foreach("keywords.csv", {headers: true, header_converters: :symbol }) do |csv_key|
#   keyword = Keyword.find_or_create_by(noun: csv_key[:noun])
#   KeywordJoin.find_or_create_by(keyword: keyword, ingredient_id: csv_key[:ingredient_id])
# end

