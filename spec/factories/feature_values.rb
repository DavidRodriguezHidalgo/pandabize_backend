FactoryBot.define do
  factory :feature_value do
    value { Faker::Color.color_name }
  end
end