class ProductsController < ApplicationController
  def index
    @products = Product.order("product_name DESC").page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    wildcard_search ="%#{params[:keywords]}%"

   #@products = Product.where("product_name LIKE ?", wildcard_search)
   #@products = @products.where(category_id: params[:category_id]) if params[:category_id].present?

    #@products = Product.select("products.*").joins(:categories).where("categories.name LIKE ? and products.product_name LIKE ?", "%#{params[:name]}%", "%#{params[:keywords]}%")
    # if params[:country_id]
    #   #@products = Product.joins(:category).where(categories: {role: Category.roles[:keywords]}, product_name: params[:keywords][:product_name].downcase)
    #   #@products = Product.joins(:countries).where("countries.id = ? and product_name LIKE ?", "%#{params[:country_id]}%", "%#{params[:keywords]}%")
    #   @products = Product.joins(:countries).where(:countries => {:id => "%#{params[:country_id]}%"}, :products => {:product_name => wildcard_search})
    # else
    #   @products = Product.where("product_name LIKE ?", wildcard_search)
    # end
    @products ||= find_products
  end

  private
    def find_products
      wildcard_search ="%#{params[:keywords]}%"
      products = Product.joins(:countries)
      products = products.where("product_name like ?", "%#{params[:keywords]}%") if params[:keywords].present?
      products = products.where("countries.name like ?", "%#{params[:country]}%") if params[:country].present?
      products
    end


end
