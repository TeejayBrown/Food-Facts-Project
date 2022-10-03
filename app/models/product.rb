class Product < ApplicationRecord
  belongs_to :product_creator
  validates :product_name, :url, :brand, :bar_code, :thumbnail, :image, presence: true

  has_many :product_countries
  has_many :countries, through: :product_countries

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :product_nutrients

  paginates_per 25
end
