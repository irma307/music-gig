class Artist < ApplicationRecord
  has_many :reviews, through: :events
end
