10.times do |n|
  name = Faker::Name.name
  email = "examples-#{n+1}@example.com"
  password = "a"
  User.create!(name: name,
               email: email,
               password: password,
               admin: false
               )
end

# 10.times do |n|
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(name: name,
#                email: email,
#                password: password,
#                admin: true
#                )
# end
