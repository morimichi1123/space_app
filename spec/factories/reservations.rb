FactoryBot.define do
  factory :reservation do
    sequence(:id) { |n| }
    sequence(:user_id) { |n| rand(1..100) }
    space_id {1}
    start_date { "2019-11-29 05:16:02" }
    end_date { "2019-11-30 05:16:02" }
  end
end
