class Country < ApplicationRecord
  has_many :product_countries
  has_many :products, through: :product_countries

  #validates :name, presence: true, uniqueness: true
end
