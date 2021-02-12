FactoryBot.define do
    brands = ["Trek", "Norco", "Schwinn"]
    factory :brand do
        name { brands.sample }
        price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
        stock { Faker::Number.between(from: 1, to: 10) }
    end

    trait :no_stock do
        stock { 0 }
    end
  end
  