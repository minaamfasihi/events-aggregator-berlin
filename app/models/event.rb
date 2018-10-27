class Event < ApplicationRecord
  belongs_to :web_source

  validates :title, presence: true, length: { in: 2..1000,
    too_long: "Too long!", too_short: "Too short!"
   }
  validates :event_start_date, presence: true
  validates :event_url, presence: true, length: { maximum: 1000 }

  scope :coberlin, -> { where("web_source_id = ?", WebSource.find_by(title: 'Co_Berlin')&.id) }
  scope :berghain, -> { where("web_source_id = ?", WebSource.find_by(title: 'Berghain')&.id) }
  scope :by_title, -> (title) { where("title ILIKE :title", title: "%#{title}%") }
  scope :by_date, -> (start_date, end_date) { where("event_start_date >= ? OR event_end_date <= ?", start_date, end_date)}
end
