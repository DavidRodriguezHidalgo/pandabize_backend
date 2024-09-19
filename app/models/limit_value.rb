class LimitValue < ApplicationRecord
  belongs_to :limit
  belongs_to :feature
  has_and_belongs_to_many :feature_values
end
