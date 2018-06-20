class Artist < ApplicationRecord
  has_many :events
  has_many :reviews, through: :events
  belongs_to :user
  validates :name, presence: true
  mount_uploader :photo, PhotoUploader
  GENRES = ["jazz", "rock", "rap", "pop", "classical"]

  def average
    ratings = 0
    self.reviews.each do |review|
      ratings += review.rating
    end
    if self.reviews.count == 0
      average = "No Ratings"
    else
      average = ratings / self.reviews.count
    end
  end
end
