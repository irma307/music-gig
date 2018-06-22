class Event < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :artist
  validates :status, inclusion: { in: %w(pending confirmed canceled)}
end
