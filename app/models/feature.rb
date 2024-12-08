class Feature < ApplicationRecord
  has_and_belongs_to_many :brands
  has_one :limit
  has_many :feature_values, dependent: :destroy

  validates_presence_of :name
end
