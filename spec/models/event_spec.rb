require 'rails_helper'

describe Event do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:event_start_date) }
  it { is_expected.to validate_presence_of(:event_url) }
  it { is_expected.to validate_length_of(:event_url).is_at_most(1000) }
  it { is_expected.to validate_length_of(:details).is_at_most(1000) }
  it { is_expected.to validate_length_of(:img_url).is_at_most(1000) }
  it { is_expected.to validate_length_of(:category).is_at_most(150) }
  it { is_expected.to validate_length_of(:subtitle).is_at_most(150) }
end

describe Event, type: :model do
  it "shows only CoBerlin events" do
    WebSource.create(
      title: 'Co_Berlin',
      url: 'https://www.co-berlin.org/en/calender',
      base_url: 'https://www.co-berlin.org',
    )
    WebSource.create(
      title: 'Berghain',
      url: 'http://berghain.de/events/',
      base_url: 'http://berghain.de',
    )
    10.times do |event|
      WebSource.first.events.create(
        title: Faker::Movie.quote,
        event_start_date: Date.today,
        event_url: Faker::Movie.quote,
        img_url: Faker::Movie.quote,
        category: Faker::Movie.quote,
        subtitle: Faker::Movie.quote
      )
    end
    expect(Event.coberlin.count).to eq(10)
  end
end

# describe "GET 'https://co-berlin.org/en/calender'", :type => :feature do
#   it 'checks if content calendar exists' do
#     visit('https://co-berlin.org/en/calender')
#     expect(page).to have_content('Calendar')
#     puts 'Cool, Calendar exists.'
#   end
# end

# describe "GET 'http://berghain.de/events/'", :type => :feature do
#   it 'checks if content dancefloor exists' do
#     visit('http://berghain.de/events/')
#     expect(page).to have_content('Dancefloor')
#     puts 'Cool, Dancefloor exists.'
#   end
# end

# p "Sleeping for 60 secs"
# sleep 60

# describe "GET 'http://berghain.de/events/'", :type => :feature do
#   it 'checks if content stage exists' do
#     visit('http://berghain.de/events')
#     expect(page).to have_content('Stage')
#     puts 'Cool, Stage exists.'
#   end
# end
