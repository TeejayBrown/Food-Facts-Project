class Country < ApplicationRecord
  has_many :product_countries
  has_many :products, through: :product_countries

  #validates :name, presence: true, uniqueness: true

  def self.ordered_by_countries
    @categories = Country.select("countries.*")
                                      .select("COUNT(countries.id) as country_count")
                                      .left_joins(:products)
                                      .group("countries.id")
                                      .order("country_count DESC")
  end

  paginates_per 50
end
