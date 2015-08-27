FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    admin false
    password "abcd1234"

    factory :admin do
      admin true
    end

    factory :invalid_password do
      password ""
    end

    factory :invalid_email do
      email ""
    end

    factory :user1 do
      name {Faker::Name.name}
      email {Faker::Internet.email}
    end
  end
end
