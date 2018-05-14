module V1
  class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]
    before_action :set_item, only: [:create]

    # GET /orders
    def index
      @orders = Order.all

      render json: @orders
    end

    # GET /orders/1
    def show
      render json: @order
    end

    # POST /orders
    def create
      @order = Order.new(order_params)

      fill_data

      if @order.save
        @menu_item
          .update_attribute(
            :quantity,
            @menu_item.quantity - @order.quantity
          )
        render json: @order, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /orders/1
    def update
      if @order.update(order_params)
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    # DELETE /orders/1
    def destroy
      @order.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end

      def set_item
        @menu_item = MenuItem.find(params[:menu_item_id])
      end

      def fill_data
        @order.restaurant_id = @menu_item.restaurant.id
        @order.total = @menu_item.price * @order.quantity
      end

      # Only allow a trusted parameter "white list" through.
      def order_params
        params.permit(:menu_item_id, :customer_id, :quantity, :order_status_id, :total)
      end
  end
end
