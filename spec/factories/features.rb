FactoryBot.define do
  names = ["Wheel Size", "Rim Color", "Saddle Color"]
  factory :feature do
    name { names.sample }
  end
end
