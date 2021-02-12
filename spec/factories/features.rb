FactoryBot.define do
  names = ["Wheel Size", "Rim Color", "Saddle Color"]
  factory :feature do
    name { names.sample }

    after(:build) do |property, evaluator|
      property.brand_id = Brand.first.id
    end
  end
end
