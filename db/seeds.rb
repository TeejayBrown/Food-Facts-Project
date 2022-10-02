require "csv"

Product.delete_all
ProductCreator.delete_all
Page.delete_all

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


  #puts p['product_name']

end

puts "The creators created #{ProductCreator.count} products"
puts "Created #{Product.count} products"
