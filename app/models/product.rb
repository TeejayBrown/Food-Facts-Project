class Product < ApplicationRecord
  belongs_to :product_creator
  validates :product_name, :url, :brand, :bar_code, :thumbnail, :image, presence: true
end
