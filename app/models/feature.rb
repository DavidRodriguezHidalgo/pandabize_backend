class Feature < ApplicationRecord
    belongs_to :brand
    has_many :feature_values, dependent: :destroy

    validates_presence_of :name
end
