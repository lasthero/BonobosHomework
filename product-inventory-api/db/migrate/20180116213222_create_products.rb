class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, id: false do |t|
      t.integer :product_id, null: false
      t.text :product_name
      t.text :product_image
      t.text :product_description

      t.timestamps
    end
  end
end
