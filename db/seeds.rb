brand1 = Brand.create(name: 'Trek', price: 19.99)
Brand.create(name: 'Norco', price: 39.99)
brand3 = Brand.create(name: 'Schwinn', price: 39.99)

feature1 = Feature.create(name: 'Wheel Size', brands: [brand1, brand3])
feature2 = Feature.create(name: 'Rim Color', brands: [brand1, brand3])
feature3 = Feature.create(name: 'Saddle Color', brands: [brand1])

feature_value_1 = FeatureValue.create(value: '17', feature: feature1)
feature_value_2 = FeatureValue.create(value: '19', feature: feature1)
feature_value_3 = FeatureValue.create(value: '21', feature: feature1)

feature_value_4 = FeatureValue.create(value: 'blue', feature: feature2)
feature_value_5 = FeatureValue.create(value: 'black', feature: feature2)
feature_value_6 = FeatureValue.create(value: 'green', feature: feature2)

FeatureValue.create(value: 'blue', feature: feature3)
FeatureValue.create(value: 'black', feature: feature3)
FeatureValue.create(value: 'green', feature: feature3)

Order.create(items: [
    {
        id: brand1.id, 
        quantity: 2,
        selected_features: [
        {feature: feature1.name, feature_value: feature_value_1.value},
        {feature: feature2.name, feature_value: feature_value_5.value}
        ]
    },
    {
        id: brand3.id,
        quantity: 1,
        selected_features: [
        {feature: feature2.name, feature_value: feature_value_4.value}
        ]
    },
])

limit_1 = Limit.create(feature: feature1)
limit_2 = Limit.create(feature: feature2)
LimitValue.create(limit: limit_1, feature: feature1, feature_values: [feature_value_3])
LimitValue.create(limit: limit_2, feature: feature2, feature_values: [feature_value_4, feature_value_6])