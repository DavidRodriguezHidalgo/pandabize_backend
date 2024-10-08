# frozen_string_literal: true

module Types
  class LimitType < Types::BaseObject
    field :id, ID, null: false
    field :feature_value_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
