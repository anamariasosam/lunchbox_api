module V1
  class CustomerOrdersController < ApplicationController
    before_action :set_order, only: [:show, :destroy]

    # GET /v1/customers/:customer_id/orders
    def index
      @customer = Customer.find(params[:customer_id])

      render json: @customer.orders.all
    end

    # GET /v1/customers/:customer_id/orders/1
    def show
      render json: @order
    end

    # POST /v1/customers/:customer_id/orders
    def create
      @order = Order.new(order_params)

      if @order.save
        fill_data
        @menu_item
          .update_attribute(
            :quantity,
            @menu_item.quantity - @order.quantity
          )
        render json: @order, status: :created
      else
        render json: { error: @order.errors}, status: :unprocessable_entity
      end
    end


    # DELETE /v1/customers/:customer_id/orders/1
    def destroy
      if @order.destroy
        render json: { id: @order.id, deleted: ":("}, status: :ok
      else
        render json: { error: @order.errors}, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @customer = Customer.find(params[:customer_id])
        @order = @customer.orders.find(params[:id])
      end

      def fill_data
        @menu_item = MenuItem.find(params[:menu_item_id])
        @order.restaurant_id = @menu_item.restaurant.id
        @order.total = @menu_item.price * @order.quantity
        @order.save
      end

      # Only allow a trusted parameter "white list" through.
      def order_params
        params.permit(:menu_item_id, :customer_id, :quantity, :order_status_id)
      end
  end
end
