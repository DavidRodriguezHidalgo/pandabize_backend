class Brand < ApplicationRecord
  has_and_belongs_to_many :features
      
  validates_presence_of [:name, :price]
end
