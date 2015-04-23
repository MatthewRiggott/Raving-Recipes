include Treat::Core::DSL

Ingredient.all.each do |ingredient|
  ingredient.split(" ").each do |word|
    if word.category == "noun"
      keyword = Keyword.find_or_create_by(noun: word)
      KeywordJoin.create(ingredient: ingredient, keyword: keyword)
    end
  end
end
