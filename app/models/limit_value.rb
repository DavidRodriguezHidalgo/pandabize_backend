class LimitValue < ApplicationRecord
    belongs_to :limit
    belongs_to :feature
    has_and_belongs_to_many :feature_values

    def name
        feature.name.to_s + " - " + feature_values.map{ |feature_value| feature_value.name.to_s}.join(',') if feature && feature_values
    end
end
