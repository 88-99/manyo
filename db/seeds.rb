10.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "a"
  @user = User.create!(name: name,
               email: email,
               password: password,
               admin: false
               )
  3.times do |m|
    Task.create!(title: "title-#{m+1}",
                 content: "content-#{m+1}",
                 deadline: "20201010",
                 status: 1,
                 priority: 0,
                 user_id: @user.id
                 )
  end
end

10.times do |n|
  name = Faker::Creature::Animal.unique.name
  Label.create!(name: name
               )
end

# 10.times do |n|
#   Label.create!(name: "label_name-#{n+1}"
#                )
# end


# 30.times do |n|
#   Task.create!(title: "title-#{n+1}",
#                content: "content-#{n+1}",
#                deadline: "20201010",
#                status: 1,
#                priority: 0,
#                user_id: @user.id
#                )
# end


# 10.times do |n| #error出る
#   title = Faker::Creature::Animal.unique.name
#   content = content
#   deadline = deadline
#   status = status
#   priority = priority
#   user_id = user_id
#   Task.create!(title: title,
#                content: content,
#                deadline: deadline,
#                status: status,
#                priority: priority,
#                user_id: 62,
#                )
# end


# 10.times do |n|
#   name = Faker::Name.name
#   email = "examples-#{n+1}@example.com"
#   password = "a"
#   User.create!(name: name,
#                email: email,
#                password: password,
#                admin: false
#                )
# end
