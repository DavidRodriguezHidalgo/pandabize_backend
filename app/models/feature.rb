class Feature < ApplicationRecord
    belongs_to :brand
    has_many :feature_values
end
