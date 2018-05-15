module V1
  class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :update, :destroy]

    # GET /v1/restaurants
    def index
      @restaurants = Restaurant.all

      render json: @restaurants
    end

    # GET /v1/restaurants/1
    def show
      render json: @restaurant
    end

    # POST /v1/restaurants
    def create
      @restaurant = Restaurant.new(restaurant_params)

      if @restaurant.save
        render json: @restaurant, status: :created
      else
        render json: { error: @restaurant.errors}, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/restaurants/1
    def update
      if @restaurant.update(restaurant_params)
        render json: @restaurant
      else
        render json: { error: @restaurant.errors}, status: :unprocessable_entity
      end
    end

    # DELETE /v1/restaurants/1
    def destroy
      if @restaurant.destroy
        render json: { id: @restaurant.id, deleted: ":("}, status: :ok
      else
        render json: { error: @restaurant.errors}, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_restaurant
        @restaurant = Restaurant.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def restaurant_params
        params.permit(:name, :image_url, :location, :min_price, :max_price)
      end
  end
end
