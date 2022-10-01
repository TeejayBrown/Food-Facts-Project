class ProductsController < ApplicationController
  def index
    @products = Product.order("product_name DESC").limit(100)
  end

  def show
    @product = Product.find(params[:id])
  end
end
