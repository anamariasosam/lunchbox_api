module V1
  class RestaurantMenuItemsController < ApplicationController
    before_action :set_menu_item, only: [:show, :update, :destroy]

    # GET /v1/restaurants/:restaurant_id/menu_items
    def index
      @restaurant = Restaurant.find(params[:restaurant_id])

      render json: @restaurant.menu_items
    end

    # GET /v1/restaurants/:restaurant_id/menu_items/1
    def show
      render json: @menu_item
    end

    # POST /v1/restaurants/:restaurant_id/menu_items
    def create
      @menu_item = MenuItem.new(menu_item_params)

      if @menu_item.save
        render json: @menu_item, status: :created
      else
        render json: { error: @menu_item.errors}, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/restaurants/:restaurant_id/menu_items/1
    def update
      if @menu_item.update(menu_item_params)
        render json: @menu_item
      else
        render json: { error: @menu_item.errors}, status: :unprocessable_entity
      end
    end

    # DELETE /v1/restaurants/:restaurant_id/menu_items/1
    def destroy
      if @menu_item.destroy
        render json: { id: @menu_item.id, deleted: ":("}, status: :ok
      else
        render json: { error: @menu_item.errors}, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_menu_item
        @restaurant = Restaurant.find(params[:restaurant_id])
        @menu_item = @restaurant.menu_items.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def menu_item_params
        params.permit(:item_name, :description, :ingredients, :price, :image_url, :quantity, :restaurant_id)
      end
  end
end
