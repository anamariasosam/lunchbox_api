module V1
  class RestaurantMenuItemsController < ApplicationController
    before_action :set_menu_item, only: [:show, :update, :destroy]

    # GET /menu_items
    def index
      @restaurant = Restaurant.find(params[:restaurant_id])

      @menu_items = @restaurant.menu_items

      render json: @menu_items
    end

    # GET /menu_items/1
    def show
      render json: @menu_item
    end

    # POST /menu_items
    def create
      @menu_item = MenuItem.new(menu_item_params)

      if @menu_item.save
        render json: @menu_item, status: :created
      else
        render json: @menu_item.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /menu_items/1
    def update
      if @menu_item.update(menu_item_params)
        render json: @menu_item
      else
        render json: @menu_item.errors, status: :unprocessable_entity
      end
    end

    # DELETE /menu_items/1
    def destroy
      @menu_item.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_menu_item
        @menu_item = MenuItem.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def menu_item_params
        params.permit(:item_name, :description, :ingredients, :price, :imageUrl, :quantity, :restaurant_id)
      end
  end
end
