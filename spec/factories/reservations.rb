FactoryBot.define do
  factory :reservation do
    user_id {3}
    space_id {2}
    start_date { "2019-12-20 05:16:02" }
    end_date { "2019-12-30 05:16:02" }
  end
end
