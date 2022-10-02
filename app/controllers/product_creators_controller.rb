class ProductCreatorsController < ApplicationController
  def index
    #@product_creators = ProductCreator.all

    @product_creators = ProductCreator.ordered_by_top_creators

  end

  def show
    @product_creator = ProductCreator.find(params[:id])
  end
end
