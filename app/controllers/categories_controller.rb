class CategoriesController < ApplicationController
  def index
    @categories = Category.ordered_by_categories.page params[:page]
  end

  def show
    @category = Category.find(params[:id])
  end
end
