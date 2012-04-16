# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    user_id 1
    name "MyString"
    description "MyText"
  end
end
