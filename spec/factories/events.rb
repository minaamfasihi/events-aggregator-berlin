FactoryGirl.define do
  factory :event do
    title     { Faker::Movie.quote }
    details         { Faker::String.random }
    event_start_date  { Date.today }
    event_end_date { Date.today }
    event_url { Faker::String.random }
    img_url { Faker::String.random }
    category { Faker::String.random }
    subtitle { Faker::String.random }
  end
end
