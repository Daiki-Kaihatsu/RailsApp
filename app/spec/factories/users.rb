FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TestName#{n}"}
    sequence(:email) { |n| "test#{n}@example.com"}
    password  {"foobar"}
    password_confirmation {"foobar"}
    profile { "テスト"} 
  end
end