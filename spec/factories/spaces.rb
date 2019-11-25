FactoryBot.define do
  factory :space do
    space_name { "ginza" }
    ward_id { rand(1..23) }
    price { rand(5000..10000) }
  end
end
