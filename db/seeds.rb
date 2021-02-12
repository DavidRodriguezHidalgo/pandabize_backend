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

FeatureValue.create(value: '17', feature: feature1)
FeatureValue.create(value: '18', feature: feature1)
FeatureValue.create(value: '19', feature: feature1)

FeatureValue.create(value: 'blue', feature: feature2)
FeatureValue.create(value: 'black', feature: feature2)
FeatureValue.create(value: 'silver', feature: feature2)

FeatureValue.create(value: 'red', feature: feature2)
FeatureValue.create(value: 'yellow', feature: feature2)
