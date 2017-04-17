# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# 
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# category seed
categoryList = [
	["Paper", "Paper is a thin material produced by pressing together moist fibres of cellulose pulp derived from wood, rags or grasses, and drying them into flexible sheets. It is a versatile material with many uses, including writing, printing, packaging, cleaning, and a number of industrial and construction processes.", "paper.jpg", 1],
	["Cardboard", "Cardboard is a generic term for a heavy-duty paper of various strengths, ranging from a simple arrangement of a single thick sheet of paper to complex configurations featuring multiple corrugated and uncorrugated layers.", "cardboard.jpg", 1],
	["Glass", "Glass is a non-crystalline amorphous solid that is often transparent and has widespread practical, technological, and decorative usage in, for example, window panes, tableware, and optoelectronics. The most familiar, and historically the oldest, types of glass are 'silicate glasses' based on the chemical compound silica (silicon dioxide, or quartz), the primary constituent of sand. The term glass, in popular usage, is often used to refer only to this type of material, which is familiar from use as window glass and in glass bottles. Of the many silica-based glasses that exist, ordinary glazing and container glass is formed from a specific type called soda-lime glass, composed of approximately 75 percent silicon dioxide (SiO2), sodium oxide (Na2O) from sodium carbonate (Na2CO3), calcium oxide, also called lime (CaO), and several minor additives.", "glass.jpg", 1],
	["Plastic", "Plastic is a material consisting of any of a wide range of synthetic or semi-synthetic organic compounds that are malleable and can be molded into solid objects. Plastics are typically organic polymers of high molecular mass, but they often contain other substances. They are usually synthetic, most commonly derived from petrochemicals, but many are made from renewable materials such as polylactic acid from corn or cellulosics from cotton linters.[2] Plasticity is the general property of all materials that are able to irreversibly deform without breaking, but this occurs to such a degree with this class of moldable polymers that their name is an emphasis on this ability.", "plastic.jpg", 1],
	["Metal", "A metal is a material (an element, compound, or alloy) that is typically hard, opaque, shiny, and has good electrical and thermal conductivity. Metals are generally malleable—that is, they can be hammered or pressed permanently out of shape without breaking or cracking—as well as fusible (able to be fused or melted) and ductile (able to be drawn out into a thin wire).[3] About 91 of the 118 elements in the periodic table are metals, the others are nonmetals or metalloids. Some elements appear in both metallic and non-metallic forms.", "metal.jpg", 1],
	["Oil", "An oil is any neutral, nonpolar chemical substance that is a viscous liquid at ambient temperatures and is both hydrophobic and lipophilic. Oils have a high carbon and hydrogen content and are usually flammable and surface active.", "oil.jpg", 5],
	["Electronics", "Electronics is the science of controlling electrical energy electrically, in which the electrons have a fundamental role. Electronics deals with electrical circuits that involve active electrical components such as vacuum tubes, transistors, diodes, integrated circuits, associated passive electrical components, and interconnection technologies. Commonly, electronic devices contain circuitry consisting primarily or exclusively of active semiconductors supplemented with passive elements; such a circuit is described as an electronic circuit.", "electronics.jpg", 4],
	["Green", "Green waste is biodegradable waste that can be composed of garden or park waste, such as grass or flower cuttings and hedge trimmings, as well as domestic and commercial food waste. The differentiation green identifies it as high in nitrogen, as opposed to brown waste, which is primarily carbonaceous.", "greenwaste.jpg", 3]
]

categoryList.each do |name, description, image_link, recycle_class|
	Category.create(name: name, description: description, image_link: image_link, recycle_class: recycle_class)
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
	["Motor oil", "", "", 6],
	["Aluminum foil", "", "", 5],
	["Clean Paper", "", "", 1],
]

subcategoryList.each do |name, description, image_link, category_id|
	Subcategory.create(name: name, description: description, image_link: image_link, category_id: category_id)
end

# city seed 
cityList = [
	["Claremont", "California", "91711", "Claremont is a city on the eastern edge of Los Angeles County, California, United States, 30.3 miles (48.8 km) east of downtown Los Angeles. Claremont is home to the world famous Harvey Mudd College.", "claremont.jpg", "1", "http://www.ci.claremont.ca.us/government/departments-divisions/community-services/trash-and-recycling"],
	["San Francisco", "California", "94105", "San Francisco, in northern California, is a hilly city on the tip of a peninsula surrounded by the Pacific Ocean and San Francisco Bay. It's known for its year-round fog, iconic Golden Gate Bridge, cable cars and colorful Victorian houses.", "san_francisco.jpg", "2", "https://sfenvironment.org/zero-waste/recycling-and-composting"],
	["Upland", "California", "91786", "Upland is a city in San Bernardino County, California, in the United States. It was incorporated on May 15, 1906, after previously being named North Ontario. Upland is located at the foot of the highest part of the San Gabriel Mountains.", "upland.png", "3", "https://www.uplandpl.lib.ca.us/#Trash"]
]

cityList.each do |name, state, zipcode, description, image_link, uid, website|
	city = City.create(name: name, state: state, zipcode: zipcode, description: description, image_link: image_link, uid: uid, website: website)

  uploader = MediaUploader.new(city, 'image_link')
	uploader.store!(File.open(File.join(Rails.root, "db/seed/cities/#{image_link}")))

	city.update(image_link: uploader)
end

# recycle seed
recycleList = [
	[1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [1, 9], [1, 10], [1, 11], [1, 12], [1, 13], [1, 14], [1, 15], [1, 16], [1, 17], [1, 18], [1, 19], [1, 20], [1, 21], [1, 22], [1, 23], [1, 24], [1, 25], [1, 26], [1, 27], [1, 28], [1, 29], [1, 30], [1, 31], [1, 32], [1, 33], [1, 34], [1, 35], [1, 36], [1, 37], [1, 38], [1, 39], [1, 40], [1, 41], [1, 42], [1, 43], [1, 44], [1, 45], [1, 46], [1, 47], [1, 48], [1, 49], [1, 50], [1, 51], [1, 52],
	[2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 53],
	[3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [3, 8], [3, 9], [3, 10], [3, 11], [3, 12], [3, 13], [3, 14], [3, 15], [3, 16], [3, 17], [3, 18], [3, 19], [3, 20], [3, 21], [3, 22], [3, 23], [3, 24], [3, 25], [3, 26], [3, 27], [3, 28], [3, 29], [3, 30], [3, 31], [3, 32], [3, 33], [3, 34], [3, 35], [3, 36], [3, 37], [3, 38], [3, 39], [3, 40], [3, 41], [3, 42], [3, 43], [3, 44], [3, 45], [3, 46], [3, 47], [3, 48], [3, 49], [3, 50], [3, 51], [3, 52], [3, 53], [3, 54]
]

recycleList.each do |city_id, subcategory_id|
	Recycle.create(city_id: city_id, subcategory_id: subcategory_id)
end

# facilities seed
facilitiesList = [
	["Residential Recycling Center", "City Yard - 1616 Monte Vista Avenue, Claremont", "91711", "909-399-5431", nil], # paper, cardboard, glass, plastic, metal, and aluminum
	["Connie and Dick's Automotive", "150 Olive Street, Claremont", "91711", "909-626-5653", "www.connieanddicks.com"], # oil
	["GreenWay Solid Waste & Recycling Inc", "10660 Silicon Avenue #H, Montclair", "91763", "909-518-7943", "www.greenwayrecyclinginc.com"], # Electronic
	["Clean LA", "900 S, Fremont Ave, Alhambra", "91803", "888-253-2652", "www.888cleanla.com"], # other hazardous
	["Burrtec", "Barstow", "92311", "909-822-2397", "http://www.burrtec.com/residential"],
	["San Francisco Department of the Environment (SF Environment)", "1455 Market St #1200, San Francisco, CA", "94103", "(415) 355-3700", "sfenvironment.org"]
]

facilitiesList.each do |name, street_address, zipcode, phone_number, website, city_id|
	Facility.create(name: name, street_address: street_address, zipcode: zipcode, phone_number: phone_number, website: website)
end

# has_facilities seed
hasFacilityLst = [
	[1, 1], [1, 2], [1, 3], [1, 4],
	[3, 5],
	[2, 6]
]

hasFacilityLst.each do |city_id, facility_id|
	HasFacility.create(city_id: city_id, facility_id: facility_id)
end

# facility_recycle seed
facilityRecycleList = [
	[1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [2, 6], [3, 7], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [6, 8]
]

facilityRecycleList.each do |facility_id, category_id|
	FacilityRecycle.create(facility_id: facility_id, category_id: category_id)
end
