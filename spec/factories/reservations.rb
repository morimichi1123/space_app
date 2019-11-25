FactoryBot.define do
  factory :reservation do
    reservation_id { rand(5000..10000) }
    user_id { rand(5000..10000) }
    space_id { rand(5000..10000) }
    start_date { "2019-11-29 05:16:02" }
    end_date { "2019-11-30 05:16:02" }
  end
end
