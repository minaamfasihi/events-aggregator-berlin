class Event < ApplicationRecord
  belongs_to :web_source

  validates :title, presence: true, length: { in: 2..1000,
    too_long: "Too long!", too_short: "Too short!"
   }
  validates :event_start_date, presence: true
  validates :event_url, presence: true, length: { maximum: 1000 }
  validates :details, :event_url, :img_url, length: { maximum: 1000 }
  validates :category, :subtitle, length: { maximum: 150 }

  scope :coberlin, -> { where("web_source_id = ?", WebSource.find_by(title: 'Co_Berlin')&.id) }
  scope :berghain, -> { where("web_source_id = ?", WebSource.find_by(title: 'Berghain')&.id) }
  scope :by_title, -> (title) { where("title ILIKE :title", title: "%#{title}%") }
  scope :by_start_date, -> (start_date) { where("event_start_date = ?", start_date) }
  scope :by_end_date, -> (end_date) { where("event_end_date = ?", end_date) }
  scope :by_start_end_date, -> (start_date, end_date) { where("event_start_date >= ? AND event_end_date <= ?", start_date, end_date) }
end
