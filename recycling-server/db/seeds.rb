# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# 
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# category seed
categoryList = [
	["Paper", "", "paper.jpg"],
	["Cardboard", "", "cardboard.jpg"],
	["Glass", "", "glass.jpg"],
	["Plastic", "", "plastic.jpg"],
	["Metal", "", "metal.jpg"],
	["Oil", "", "oil.jpg"]
]

categoryList.each do |name, description, image_link|
	Category.create(name: name, description: description, image_link: image_link)
end

# subcategory seed
subcategoryList = [
	["Junk mail", "", "", 1],
	["Telephone books", "", "", 1],
	["Catalogs", "", "", 1],
	["Computer paper", "", "", 1],
	["Envelopes", "", "", 1],
	["Wrapping paper", "", "", 1],
	["Brochures", "", "", 1],
	["Crayon drawings", "", "", 1],
	["Office paper", "", "", 1],
	["Copy paper", "", "", 1],
	["Cereal boxes", "", "", 2],
	["Tissue boxes", "", "", 2],
	["Food boxes", "", "", 2],
	["Milk cartons", "", "", 2],
	["Juice boxes", "", "", 2],
	["Soda/beer cartons", "", "", 2],
	["Egg cartons", "", "", 2],
	["Paper bags", "", "", 2],
	["Cardboard boxes", "", "", 2],
	["Gift boxes", "", "", 2],
	["Styrofoam packaging", "", "", 2],
	["Juice bottles", "", "", 3],
	["Beer bottles", "", "", 3],
	["Wine bottles", "", "", 3],
	["Liquor bottles", "", "", 3],
	["Baby food jars", "", "", 3],
	["Condiment jars", "", "", 3],
	["Jam jars", "", "", 3],
	["Jelly jars", "", "", 3],
	["Assorted food jars", "", "", 3],
	["Salad dressing bottles", "", "", 3],
	["Plastic water bottles", "", "", 4],
	["Plastic soda bottles", "", "", 4],
	["Plastic milk jugs", "", "", 4],
	["Plastic laundry jugs", "", "", 4],
	["Shampoo bottles", "", "", 4],
	["Lotion bottles", "", "", 4],
	["Food containers", "", "", 4],
	["Condiment bottles", "", "", 4],
	["Motor oil containers", "", "", 4],
	["Vegetable oil bottles", "", "", 4],
	["Aluminum soda cans", "", "", 5],
	["Aluminum beer cans", "", "", 5],
	["Fruit cans", "", "", 5],
	["Vegetable cans", "", "", 5],
	["Pet food cans", "", "", 5],
	["Juice cans", "", "", 5],
	["Soup cans", "", "", 5],
	["Sauce cans", "", "", 5],
	["Assorted food cans", "", "", 5],
	["Metal Hangers", "", "", 5],
	["Motor oil", "", "", 6]
]

subcategoryList.each do |name, description, image_link, category_id|
	Subcategory.create(name: name, description: description, image_link: image_link, category_id: category_id)
end

# city seed 
cityList = [
	["Claremont", "California", "91711", "Claremont is a city on the eastern edge of Los Angeles County, California, United States, 30.3 miles (48.8 km) east of downtown Los Angeles. Claremont is home to the world famous Harvey Mudd College.", "claremont.jpg"]
]

cityList.each do |name, state, zipcode, description, image_link|
	City.create(name: name, state: state, zipcode: zipcode, description: description, image_link: image_link)
end

# recycle seed
recycleList = [
	[1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [1, 9], [1, 10], [1, 11], [1, 12], [1, 13], [1, 14], [1, 15], [1, 16], [1, 17], [1, 18], [1, 19], [1, 20], [1, 21], [1, 22], [1, 23], [1, 24], [1, 25], [1, 26], [1, 27], [1, 28], [1, 29], [1, 30], [1, 31], [1, 32], [1, 33], [1, 34], [1, 35], [1, 36], [1, 37], [1, 38], [1, 39], [1, 40], [1, 41], [1, 42], [1, 43], [1, 44], [1, 45], [1, 46], [1, 47], [1, 48], [1, 49], [1, 50], [1, 51], [1, 52] 
]

recycleList.each do |city_id, subcategory_id|
	Recycle.create(city_id: city_id, subcategory_id: subcategory_id)
end
