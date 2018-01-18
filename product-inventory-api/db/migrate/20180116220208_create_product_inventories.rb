class CreateProductInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_inventories do |t|
      t.integer :product_id
      t.integer :waist
      t.integer :length
      t.text :style
      t.integer :count

      t.timestamps
    end
    add_foreign_key :product_inventories, :products, column: :product_id, primary_key: "product_id"
  end
end
