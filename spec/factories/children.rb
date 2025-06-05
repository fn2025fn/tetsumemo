FactoryBot.define do
  factory :child do
    name { 'MyString' }
    association :user
  end
end
