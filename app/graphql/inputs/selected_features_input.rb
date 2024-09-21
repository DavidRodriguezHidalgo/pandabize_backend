
module Inputs
  class SelectedFeaturesInput < Types::BaseInputObject
    argument :feature_id, ID, required: true
    argument :feature_value_id, ID, required: true
  end
end