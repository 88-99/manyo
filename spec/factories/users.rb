FactoryBot.define do
  factory :user do
    trait :a do
      id { 1 }
      name { "factory_user_aaa" }
      email { "test@user.com" }
      password { "a" }
    end

    trait :b do
      id { 2 }
      name { "factory_user_bbb" }
      email { "test@user2.com" }
      password { "b" }
    end
  end
end
