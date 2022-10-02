class ProductCreator < ApplicationRecord
  has_many :products
  validates :name, presence:true, uniqueness: true

  def self.ordered_by_top_creators
    @product_creators = ProductCreator.select("product_creators.*")
                                      .select("COUNT(product_creators.id) as product_count")
                                      .left_joins(:products)
                                      .group("product_creators.id")
                                      .order("product_count DESC")
  end
end
