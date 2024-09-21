
module Types
  class SelectedFeaturesType < Types::BaseObject
    field :feature, String, null: false
    field :feature_value, String, null: false
  end
end