# frozen_string_literal: true

module Types
  class LimitType < Types::BaseObject
    field :id, ID, null: false
    field :feature_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :limit_values, [Types::LimitValueType], null: true

    def limit_values
      object.limit_values
    end
  end
end
