module V1
  class RestaurantOrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]

    # GET /v1/restaurants/:restaurant_id/orders
    def index
      @restaurant = Restaurant.find(params[:restaurant_id])
      render json: @restaurant.orders.all
    end

    # GET /v1/restaurants/:restaurant_id/orders/1
    def show
      render json: @order
    end

    # PATCH/PUT /v1/restaurants/:restaurant_id/orders/1
    def update
      if @order.update(order_params)
        render json: @order
      else
        render json: { error: @order.errors}, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @restaurant = Restaurant.find(params[:restaurant_id])
        @order = @restaurant.orders.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def order_params
        params.permit(:menu_item_id, :customer_id, :quantity, :order_status_id)
      end
  end
end
