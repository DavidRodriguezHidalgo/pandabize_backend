# frozen_string_literal: true

module Types
  class FeatureType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :feature_values, [Types::FeatureValueType], null: true
    field :limit, Types::LimitType, null: true

    def feature_values
      object.feature_values
    end
  end
end
