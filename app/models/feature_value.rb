class FeatureValue < ApplicationRecord
  belongs_to :feature
  has_and_belongs_to_many :limit_values
  has_one :limit

  validates_presence_of :value

  def name
     value
  end
end
