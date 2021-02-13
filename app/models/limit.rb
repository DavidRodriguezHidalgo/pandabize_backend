class Limit < ApplicationRecord
    belongs_to :feature_value
    has_many :limit_values, dependent: :destroy

    validates_presence_of :feature_value
end
