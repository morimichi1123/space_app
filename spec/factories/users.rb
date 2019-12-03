FactoryBot.define do
  factory :user do
    id {2}
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    password { "password" }
    password_confirmation { "password" }
    admin {0}
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
