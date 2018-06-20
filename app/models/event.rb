class Event < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  has_many :reviews
  validates :status, inclusion: { in: %w(pending confirmed canceled)}
end
