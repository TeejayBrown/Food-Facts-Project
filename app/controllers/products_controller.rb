class ProductsController < ApplicationController
  def index
    @products = Product.order("product_name DESC").limit(100).page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    wildcard_search ="%#{params[:keywords]}%"
    @products = Product.where("product_name LIKE ?", wildcard_search)
  end


end
