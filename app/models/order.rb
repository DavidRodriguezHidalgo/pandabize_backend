class Order < ApplicationRecord
    before_save :calculate_amount
    serialize :items, JSON

    validates_presence_of [:items]
    validate :validate_items_row

    private

    def calculate_amount
        amountAux = 0
        items.each do |item|
            amountAux += item['quantity'] * item['price']
        end
        self.amount = amountAux
    end

    def validate_items_row
        return errors.add(:items, 'not array items') unless items.kind_of?(Array)
        return errors.add(:items, 'empty items') if items.length == 0
        first_item = items.first
        return errors.add(:items, 'should have a product') unless first_item.key?("product")
        return errors.add(:items, 'should have a quantity') unless first_item.key?("quantity")
        return errors.add(:items, 'should have a price') unless first_item.key?("price")
        return errors.add(:items, 'should have a selected features') unless first_item.key?("selected_features")
        return errors.add(:items, 'items should have selected features as an array') unless first_item["selected_features"].kind_of?(Array)
        return errors.add(:items, 'items should have selected features should have at least an item') if first_item["selected_features"].length == 0
        selected_features = first_item["selected_features"]
        return errors.add(:items, 'items should have at least, one feature and his value') unless selected_features.length > 0
        return errors.add(:items, 'items should have a feature') unless selected_features.first.key?("feature")
        return errors.add(:items, 'items should have a value') unless selected_features.first.key?("feature_value")
    end
end
