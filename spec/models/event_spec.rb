require 'rails_helper'

describe Event do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:event_start_date) }
  it { is_expected.to validate_presence_of(:event_url) }
  it { is_expected.to validate_presence_of(:details) }
end

