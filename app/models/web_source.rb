class WebSource < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :title, presence: true, length: { in: 2..100, too_long: "Too long", too_short: "Too short" }
end
