FactoryBot.define do
  factory :feature_value do
    value { Faker::Color.color_name }
    after(:build) do |property, evaluator|
      property.feature_id = Feature.first.id
    end
  end
end
