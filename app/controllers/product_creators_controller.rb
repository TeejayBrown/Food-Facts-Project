class ProductCreatorsController < ApplicationController
  def index
    @product_creators = ProductCreator.all
  end

  def show
    @product_creator = ProductCreator.find(params[:id])
  end
end
