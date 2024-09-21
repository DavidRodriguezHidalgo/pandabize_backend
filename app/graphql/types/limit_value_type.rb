# frozen_string_literal: true

module Types
  class LimitValueType < Types::BaseObject
    field :id, ID, null: false
    field :limit_id, Integer
    field :feature_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end