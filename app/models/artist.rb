class Artist < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :events
end
