class Brand < ApplicationRecord
    default_scope { where("stock > ?", 0) }
    
    has_many :features, dependent: :destroy
    
    validates_presence_of [:name, :price, :stock]
end
