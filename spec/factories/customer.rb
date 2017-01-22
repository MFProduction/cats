FactoryGirl.define do
  factory :customer do
    email "test@test.com"
    password             "password"
    password_confirmation  "password"
  end
end
