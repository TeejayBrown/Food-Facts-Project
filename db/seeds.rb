require "csv"

#Product.delete_all
#ProductCreator.delete_all
Page.delete_all

Page.create(
  title: 'About Us'
  content: 'The data utilized in this website was taken from world.openfoodfacts.org.'
  permalink: 'about'
)

Page.create(
  title: 'Contact Us'
  content: 'Reach out to us to know more about the data preprocessing and cleaning.'
  permalink: 'contact'
)


