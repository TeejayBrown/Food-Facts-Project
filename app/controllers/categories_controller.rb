class CategoriesController < ApplicationController
  def index
    @categories = Category.ordered_by_categories.limit(100)
  end

  def show
    @category = Category.find(params[:id])
  end
end
