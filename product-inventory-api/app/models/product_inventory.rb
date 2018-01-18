class ProductInventory < ApplicationRecord
    belongs_to :product
    default_scope { order("waist, length, style") }
end
