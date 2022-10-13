class ProductsController < ApplicationController
  def index
    @products = Product.order("product_name DESC").page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    wildcard_search ="%#{params[:keywords]}%"
   @products = Product.where("product_name LIKE ?", wildcard_search)

    #@products = Product.select("products.*").joins(:categories).where("categories.name LIKE ? and products.product_name LIKE ?", "%#{params[:name]}%", "%#{params[:keywords]}%")
    # if params[:keywords]
    #   #@products = Product.joins(:category).where(categories: {role: Category.roles[:keywords]}, product_name: params[:keywords][:product_name].downcase)
    #   @products = Product.joins(:categories, :product).where("categories.name LIKE ? and products.product_name LIKE ?", "%#{params[:name]}%", "%#{params[:keywords]}%")
    # else
    #     @products = Product.all
    # end
  end


end
