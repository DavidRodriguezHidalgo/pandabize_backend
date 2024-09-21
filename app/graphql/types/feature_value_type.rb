# frozen_string_literal: true

module Types
  class FeatureValueType < Types::BaseObject
    field :id, ID, null: false
    field :value, String
    field :feature_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
