FactoryBot.define do
  factory :user do
    sequence(:name) { "hoge" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :admin, class: User do
    id {1}
    name { "mori" }
    email { "mori@mori.com" }
    password { "morimori" }
    password_confirmation { "morimori" }
    admin {1}
  end

end
