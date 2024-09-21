
module Types
  class OrderItemType < Types::BaseObject
    field :product_id, ID, null: false
    field :quantity, Integer, null: false
    field :selected_features, [Types::SelectedFeaturesType], null: false
  end
end