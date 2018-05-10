class OrderStatusesController < ApplicationController
  before_action :set_order_status, only: [:show, :update, :destroy]

  # GET /order_statuses
  def index
    @order_statuses = OrderStatus.all

    render json: @order_statuses
  end

  # GET /order_statuses/1
  def show
    render json: @order_status
  end

  # POST /order_statuses
  def create
    @order_status = OrderStatus.new(order_status_params)

    if @order_status.save
      render json: @order_status, status: :created, location: @order_status
    else
      render json: @order_status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_statuses/1
  def update
    if @order_status.update(order_status_params)
      render json: @order_status
    else
      render json: @order_status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_statuses/1
  def destroy
    @order_status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_status
      @order_status = OrderStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_status_params
      params.require(:order_status).permit(:description)
    end
end
