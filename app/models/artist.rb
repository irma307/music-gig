class Artist < ApplicationRecord
  has_many :reviews, through: :events
  belongs_to :user
end
