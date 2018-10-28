FactoryGirl.define do
  factory :event do
    title     { Faker::Movie.quote }
    details         { Faker::Movie.quote }
    event_start_date  { Date.today }
    event_end_date { Date.today }
    event_url { Faker::Movie.quote }
    img_url { Faker::Movie.quote }
    category { Faker::Movie.quote }
    subtitle { Faker::Movie.quote }
  end
end
