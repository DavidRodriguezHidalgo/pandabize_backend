FactoryBot.define do
  factory :order do
    before(:create) do |order|
      brand = create(:brand)
      feature = create(:feature)
      feature_value = create(:feature_value, feature: feature)
      order.amount = brand.price
      order.items = []
      order.items.push({
        product_id: brand.id,
        quantity: 1,
        price: brand.price,
        selected_features: [
          feature: feature.name,
          feature_value: feature_value.value
        ]
      })
    end
  end
end