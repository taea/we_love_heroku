FactoryGirl.define do
  sequence :email do |n|
    "example#{n.to_s}@example.com"
  end
  factory :user, class: 'User' do
    email
    name { Faker::Name.name }
    image { Faker::Internet.url }
    default_provider_id 1
    default_provider 'facebook'
    locale 'ja'
    content { Faker::Lorem.paragraph }
  end
end
