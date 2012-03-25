FactoryGirl.define do
  factory :user do
    uid '12345'
    provider 'twitter'
    name 'John Doe'
    nickname 'johndoe'
  end
end