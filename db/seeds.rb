# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


brand1 = Brand.create(name: 'Trek', price: 19.99, stock: 20)
Brand.create(name: 'Norco', price: 39.99, stock: 0)
brand3 = Brand.create(name: 'Schwinn', price: 39.99, stock: 30)

feature1 = Feature.create(name: 'Wheel Size', brand_id: brand1.id)
feature2 = Feature.create(name: 'Rim Color', brand_id: brand1.id)
feature3 = Feature.create(name: 'Saddle Color', brand_id: brand1.id)

feature4 = Feature.create(name: 'Wheel Size', brand_id: brand3.id)
feature5 = Feature.create(name: 'Rim Color', brand_id: brand3.id)

feature_value_1 = FeatureValue.create(value: '17', feature: feature1)
feature_value_2 = FeatureValue.create(value: '19', feature: feature1)
feature_value_3 = FeatureValue.create(value: '21', feature: feature1)

feature_value_4 = FeatureValue.create(value: 'blue', feature: feature2)
feature_value_5 = FeatureValue.create(value: 'black', feature: feature2)
feature_value_6 = FeatureValue.create(value: 'green', feature: feature2)

FeatureValue.create(value: 'blue', feature: feature3)
FeatureValue.create(value: 'black', feature: feature3)
FeatureValue.create(value: 'green', feature: feature3)

FeatureValue.create(value: '17', feature: feature4)
FeatureValue.create(value: '19', feature: feature4)
FeatureValue.create(value: '21', feature: feature4)

feature_value_7 = FeatureValue.create(value: 'red', feature: feature5)
FeatureValue.create(value: 'yellow', feature: feature5)

Order.create(items: [
    {
        product: brand1.name, 
        quantity: 2,
        price: brand1.price,
        selected_features: [
        {feature: feature1.name, feature_value: feature_value_1.value},
        {feature: feature2.name, feature_value: feature_value_5.value}
        ]
    },
    {
        product: brand3.name, 
        quantity: 1,
        price: brand3.price,
        selected_features: [
        {feature: feature4.name, feature_value: feature_value_7.value}
        ]
    },
])

limit_1 = Limit.create(feature_value: feature_value_1)
limit_2 = Limit.create(feature_value: feature_value_2)
LimitValue.create(limit: limit_1, feature: feature2, feature_values: [feature_value_6])
LimitValue.create(limit: limit_2, feature: feature2, feature_values: [feature_value_4, feature_value_6])