FactoryGirl.define do
  sequence :url do |n|
    "http://example#{n.to_s}.example.com"
  end
  factory :site, class: 'Site' do
    name { Faker::Name.title }
    url
    description { Faker::Lorem.paragraphs.join("\n") }
    creator { Faker::Name.name }
    hash_tag { "##{Faker::Name.title}" }
    repository_url { Faker::Internet.url }
    scheduled_access true
    please_design true
  end
end
