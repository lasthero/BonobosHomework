class InventoriesController < ApplicationController
    def index
        @inventories = ProductInventory.where("product_id = ?", params[:product_id])
        render json: { status: 200,
                      data: @inventories }
    end
end
