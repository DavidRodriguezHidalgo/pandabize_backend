class Brand < ApplicationRecord
    default_scope { where("stock > ?", 0) }

    has_many :features
end
