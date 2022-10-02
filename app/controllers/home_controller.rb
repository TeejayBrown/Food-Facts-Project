class HomeController < ApplicationController
  def index
    @products = Product.includes(:product_creator).limit(100)
    #@product_creators = ProductCreator.all
    @product_creators = ProductCreator.ordered_by_top_creators.limit(100)
  end
end
