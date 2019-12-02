FactoryBot.define do
  factory :user do
    id {2}
    name { "hori" }
    email { "hori@hori.com" }
    password { "horihori" }
    password_confirmation { "horihori" }
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
