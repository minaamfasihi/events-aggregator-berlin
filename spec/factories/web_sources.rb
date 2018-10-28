FactoryGirl.define do
  factory :web_source do
    title     { Faker::Movie.quote }
    url         { Faker::Movie.quote }
    base_url  { Faker::Movie.quote }
  end
end
