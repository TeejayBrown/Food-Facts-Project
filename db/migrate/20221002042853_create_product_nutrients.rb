class CreateProductNutrients < ActiveRecord::Migration[7.0]
  def change
    create_table :product_nutrients do |t|
      t.decimal :energy
      t.decimal :fat
      t.decimal :carbohydrate
      t.decimal :sugar
      t.decimal :protein
      t.decimal :salt
      t.decimal :sodium
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
