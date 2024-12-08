# frozen_string_literal: true

module Types
  class BrandType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :price, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :features, [Types::FeatureType], null: true

    def features
      object.features
    end
  end
end
