class ProductNutrient < ApplicationRecord
  belongs_to :product
  validates :energy, :fat, :carbohydrate, :sugar, :protein, :salt, :sodium, presence: true
end
