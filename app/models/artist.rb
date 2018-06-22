class Artist < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :reviews, through: :events
  belongs_to :user
  validates :name, presence: true
  mount_uploader :photo, PhotoUploader
  GENRES = ["jazz", "rock", "rap", "pop", "classical"]

  def average
    ratings = 0
    average = 0
    self.reviews.each do |review|
      if self.reviews.count == 0
        average = "No ratings"
      else
        ratings += review.rating unless review.rating.nil?
        average = ratings / self.reviews.count
      end
    end

    return average
  end
end
