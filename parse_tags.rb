require 'treat'
require 'CSV'
# encoding: utf-8
include Treat::Core::DSL
#Treat::Core::Installer.install 'english' ---- takes ****FOREVER**** TO RUN

CSV.open("keywords.csv", "wb") do |keywords|
  CSV.foreach("ingredients.csv", {headers: true, header_converters: :symbol }) do |line|
    line[0].split(" ").each do |ingredient_word|
      ingredient_keyword = ingredient_word.gsub(/\W/,"")
      keywords << [ingredient_keyword.downcase, line[1]] if ingredient_keyword.category == "noun"
    end
  end
end
