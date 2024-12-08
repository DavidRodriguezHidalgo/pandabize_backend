class Limit < ApplicationRecord
  belongs_to :feature
  has_many :limit_values, dependent: :destroy

  validates_presence_of :feature
end
