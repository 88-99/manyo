FactoryBot.define do
  factory :user do
    trait :a do
      id { 1 }
      name { "factory_user_aaa" }
      email { "test@user.com" }
      password { "a" }
      admin { false }
    end

    trait :b do
      id { 2 }
      name { "factory_user_bbb" }
      email { "test@user2.com" }
      password { "b" }
      admin { false }
    end

    trait :admin do
      id { 3 }
      name { "factory_user_admin" }
      email { "test@user3.com" }
      password { "admin" }
      admin { true }
    end
  end
end
