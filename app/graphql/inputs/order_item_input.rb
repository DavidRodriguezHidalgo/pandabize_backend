
module Inputs
  class OrderItemInput < Types::BaseInputObject
    argument :product_id, ID, required: true
    argument :quantity, Integer, required: true
    argument :selected_features, [Inputs::SelectedFeaturesInput], required: true
  end
end