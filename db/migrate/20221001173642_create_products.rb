class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :url
      t.string :brand
      t.string :bar_code
      t.string :thumbnail
      t.string :image
      t.references :product_creator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
