class OrdersController < ApplicationController
    protect_from_forgery :except => [:create]
    def index
        render json: Order.all
    end

    def create
        render json: Order.create(order_params)
    end

    private

    def order_params
        params.require(:order).permit(items: [:product, :quantity, :price, selected_features: [:feature, :feature_value]]) unless params[:order].blank?
    end
end
