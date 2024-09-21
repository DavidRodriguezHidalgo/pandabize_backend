# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    field :brands, [Types::BrandType], null: false, description: "Brands list"

    field :brand, Types::BrandType, null: false, description: "Brand detail" do
      argument :id, ID, required: true
    end

    field :features, [Types::FeatureType], null: false, description: "Features list"

    field :feature_values, [Types::FeatureValueType], null: false, description: "Feature values list"

    field :limits, [Types::LimitType], null: false, description: "Limits list"

    field :limit_values, [Types::LimitValueType], null: false, description: "Limit values list"

    field :orders, [Types::OrderType], null: false, description: "Orders list"

    def brands
      Brand.all
    end

    def brand(id:)
      Brand.find id
    end

    def features
      Feature.all
    end

    def feature_values
      FeatureValue.all
    end

    def limits
      Limit.all
    end

    def limit_values
      LimitValue.all
    end

    def orders
      Order.all
    end
  end
end
