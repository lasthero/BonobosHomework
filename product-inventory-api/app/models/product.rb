class Product < ApplicationRecord
    self.primary_key = 'product_id'
    has_many :productInventories
    
end
