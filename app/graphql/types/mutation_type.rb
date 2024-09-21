# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_order, Types::OrderType do
      argument :items, [Inputs::OrderItemInput], required: true
    end

    def create_order(items:)
      order_items = []

      items.map do |item|
        item_value = {
          quantity: item[:quantity],
          product_id: item[:product_id],
          selected_features: [],
        }

        item[:selected_features].map do |selected_feature|
          selected_features_item = []
          feature = Feature.find(selected_feature[:feature_id])
          feature_value = FeatureValue.find(selected_feature[:feature_value_id])
          raise GraphQL::ExecutionError unless feature
          raise GraphQL::ExecutionError unless feature_value

          item_value[:selected_features] << {
            feature: feature.name,
            feature_value: feature_value.value,
          }

          order_items.push(item_value)
        end
      end

      Order.create!(items: order_items)
    end
  end
end
