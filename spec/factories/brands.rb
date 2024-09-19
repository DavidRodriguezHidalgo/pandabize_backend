FactoryBot.define do
  brands = ["Trek", "Norco", "Schwinn"]
  factory :brand do
      name { brands.sample }
      price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
