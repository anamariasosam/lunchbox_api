module V1
  class MenuItemsController < ApplicationController
    # GET /v1/menu_items
    def index
      @menu_items = MenuItem.all
      render json: @menu_items
    end

    # GET /v1/menu_items/1
    def show
      @menu_item = MenuItem.find(params[:id])
      render json: @menu_item
    end
  end
end
