# frozen_string_literal: true

module Types
  class LimitValueType < Types::BaseObject
    field :id, ID, null: false
    field :limit_id, Integer
    field :feature_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :feature, Types::FeatureType, null: true
    field :feature_values, [Types::FeatureValueType], null: true

    def feature
      object.feature
    end

    def feature_values
      object.feature_values
    end
  end
end
