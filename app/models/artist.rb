class Artist < ApplicationRecord
  has_many :reviews, through: :events
  belongs_to :user
  validates :name, presence: true
end
