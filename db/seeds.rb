# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'json'
require 'open-uri'
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
fetch = open(url).read
data = JSON.parse(fetch)

data['drinks'].each do |hash|
  Ingredient.create(name: hash['strIngredient1'])
end
