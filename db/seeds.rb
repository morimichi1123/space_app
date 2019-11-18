#User.create!(
#           name: "morisaki",
#           email: "mori@mori.com",
#           password:              "morimori",
#           password_confirmation: "morimori",
#           admin: true)
#
#9999.times do |n|
#user_name  = Faker::Name.name
#email = "example-#{n+1}@railstutorial.org"
#password = "password"
#password_confirmation = "password"
#User.create!(name: user_name,
#             email: email,
#             password:              password,
#             password_confirmation: password)
#end

Space.create!(
              space_name: "akasaka",
              ward_id: rand(1..23),
              price:  rand(5000..10000)
             )

9999.times do
Space.create!(
              space_name: Gimei.city.kanji,
              ward_id: rand(1..23),
              price: rand(5000..10000)
             )
end