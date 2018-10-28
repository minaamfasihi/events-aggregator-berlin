class WebSource < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :url, presence: true, length: { maximum: 200 }
  validates :base_url, length: { maximum: 200 }
end
