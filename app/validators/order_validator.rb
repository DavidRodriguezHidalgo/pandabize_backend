class OrderValidator
  def validate(items:, errors:)
    return errors.add(:items, 'not array items') unless items.kind_of?(Array)
    return errors.add(:items, 'empty items') if items.length == 0
    first_item = items.first.with_indifferent_access
    return errors.add(:items, 'should have a product') unless first_item.key?("product_id")
    return errors.add(:items, 'should have a quantity') unless first_item.key?("quantity")
    return errors.add(:items, 'should have a selected features') unless first_item.key?("selected_features")
    return errors.add(:items, 'items should have selected features as an array') unless first_item["selected_features"].kind_of?(Array)
    return errors.add(:items, 'items should have selected features should have at least an item') if first_item["selected_features"].length == 0
    selected_features = first_item["selected_features"]
    return errors.add(:items, 'items should have at least, one feature and his value') unless selected_features.length > 0
    return errors.add(:items, 'items should have a feature') unless selected_features.first.key?("feature")
    return errors.add(:items, 'items should have a value') unless selected_features.first.key?("feature_value")
  end
end