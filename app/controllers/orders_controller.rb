class OrdersController < ApplicationController
    def index
        render json: Order.all
    end

    def create
        render json: Order.create(order_params)
    end

    private

    def order_params
        params.require(:order).permit(items: [:product_id, :quantity, selected_features: [:feature, :feature_value]]) unless params[:order].blank?
    end
end