class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  #validates :name, presence: true, uniqueness: true

  def self.ordered_by_categories
    @categories = Category.select("categories.*")
                                      .select("COUNT(categories.id) as category_count")
                                      .left_joins(:products)
                                      .group("categories.id")
                                      .order("category_count DESC")
  end

  paginates_per 50
end