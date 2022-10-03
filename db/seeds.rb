require "csv"

Product.delete_all
ProductCreator.delete_all
Page.delete_all
ProductCountry.delete_all
Country.delete_all
ProductCategory.delete_all
Category.delete_all
ProductNutrient.delete_all

Page.create(
  title: 'About Us',
  content: 'The data utilized in this website was taken from world.openfoodfacts.org.',
  permalink: 'about'
)

Page.create(
  title: 'Contact Us',
  content: 'Reach out to us to know more about the data preprocessing and cleaning.',
  permalink: 'contact'
)

filename = Rails.root.join("db/products_data.csv")
puts "Loading Products from the csv file: #{filename}"

csv_data = File.read(filename)

productsData = CSV.parse(csv_data, headers: true, encoding: "utf-8")

productsData.each do |p|

  product_creator = ProductCreator.find_or_create_by(name: p['creator'])

  if product_creator && product_creator.valid?
    #create the products
    product = product_creator.products.create(
      product_name: p['product_name'],
      url: p['url'],
      brand: p['brands'],
      bar_code: p['code'],
      thumbnail: p['image_small_url'],
      image: p['image_url']
    )
    puts "Invalid Product #{p['product_name']}" unless product&.valid?
  else
    puts "Invalid manufacturing country #{p['creator']} for product #{p['product_name']}"
  end

   #product nutrient
  product.product_nutrients.create(
    energy: p['energy_100g'],
    fat: p['fat_100g'],
    carbohydrate: p['carbohydrates_100g'],
    sugar: p['sugars_100g'],
    protein: p['proteins_100g'],
    salt: p['salt_100g'],
    sodium: p['sodium_100g']
  )


  #countries
  countries = p['countries_en'].split(",").map(&:strip)

  countries.each do |country|
    country = Country.find_or_create_by(name: country)

    ProductCountry.create(product: product, country: country)
  end

  #categories
  categories = p['categories_en'].split(",").map(&:strip)

  categories.each do |category|
    category = Category.find_or_create_by(name: category)

    ProductCategory.create(product: product, category: category)
  end

end

puts "Created #{ProductCreator.count} Product Creators"
puts "Created #{Product.count} Products"
puts "Created #{Country.count} Countries"
puts "Created #{ProductCountry.count} ProductCountries"
puts "Created #{Category.count} Categories"
puts "Created #{ProductCategory.count} ProductCategories"
puts "Created #{ProductNutrient.count} ProductNutrients"