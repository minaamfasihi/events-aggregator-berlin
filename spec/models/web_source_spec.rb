require 'rails_helper'

describe WebSource do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(2) }
    it { is_expected.to validate_length_of(:title).is_at_most(100) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_length_of(:url).is_at_most(200) }
    it { is_expected.to validate_length_of(:base_url).is_at_most(200) }
end

describe WebSource, type: :model do
  it "checks if Co_Berlin exists" do
    WebSource.create(
      title: 'Co_Berlin',
      url: 'https://www.co-berlin.org/en/calender',
      base_url: 'https://www.co-berlin.org',
    )
    expect(WebSource.first.title).to eq('Co_Berlin')
  end
end

describe WebSource, type: :model do
  it "checks if Berghain exists" do
    WebSource.create(
      title: 'Berghain',
      url: 'http://berghain.de/events/',
      base_url: 'http://berghain.de',
    )
    expect(WebSource.first.title).to eq('Berghain')
  end
end
