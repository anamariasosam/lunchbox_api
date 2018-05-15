module V1
  class OrderStatusesController < ApplicationController
    before_action :set_order_status, only: [:show, :update, :destroy]

    # GET /v1/order_statuses
    def index
      @order_statuses = OrderStatus.all

      render json: @order_statuses
    end

    # GET /v1/order_statuses/1
    def show
      render json: @order_status
    end

    # POST /v1/order_statuses
    def create
      @order_status = OrderStatus.new(order_status_params)

      if @order_status.save
        render json: @order_status, status: :created
      else
        render json: { error: @order_status.errors}, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/order_statuses/1
    def update
      if @order_status.update(order_status_params)
        render json: @order_status
      else
        render json: { error: @order_status.errors}, status: :unprocessable_entity
      end
    end

    # DELETE /v1/order_statuses/1
    def destroy
      if @order_status.destroy
        render json: { id: @order_status.id, deleted: ":("}, status: :ok
      else
        render json: { error: @order_status.errors}, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order_status
        @order_status = OrderStatus.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def order_status_params
        params.permit(:description)
      end
  end
end
