class HomeController < ApplicationController
  def index
    @products = Product.includes(:product_creator)
    @product_creators = ProductCreator.all
  end
end
