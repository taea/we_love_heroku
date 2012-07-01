FactoryGirl.define do
  factory :site, :class => Site do
    name 'test'
    url 'http://example.com'
    description 'test test'
    creator 'test'
    hash_tag '#test'
    repository_url 'http://example.org'
    user_id 1
    scheduled_access TRUE
    please_design TRUE
  end
end
