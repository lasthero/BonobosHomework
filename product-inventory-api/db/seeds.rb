# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

file_path = Rails.root.join('db', 'data')
ProductInventory.destroy_all
Product.destroy_all

product_inventory_arrs  = CSV.read(file_path.join('inventory.csv'), {:encoding => 'bom|utf-8'})

line_number = 0
File.open(file_path.join('products.csv'), :encoding=>'bom|utf-8') do |f|
  f.each_line do |line|
    # remove extra spaces
    line.gsub!('", "', '","')
    line_number += 1
    products = CSV.parse(line) do |row|
      if line_number > 1
        # puts row
        product_id = row[0].to_i
        Product.create(product_id: product_id, product_name: row[1], product_image: row[2], product_description: row[3])
        inventory_list = product_inventory_arrs.select do |item|
          item[0] == row[0]
        end
        inventory_list.each do |inv|
          ProductInventory.create(product_id: product_id, waist: inv[1].to_i, length: inv[2].to_i, style: inv[3], count: inv[4].to_i)
        end       
      end        
    end
  end
end 
puts (line_number -1 ).to_s + " products created"
puts product_inventory_arrs.length.to_s + " inventory items created"