# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    user_id 1
    name "MyRoom"
    description "It' my room!!!"
  end
end
