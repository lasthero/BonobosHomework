class ProductsController < ApplicationController
    def index
        @products = Product.includes(:productInventories).all().order(:product_id)

        render json: { status: 200,
                      data: @products.to_json(include: :productInventories)}
    end
end
