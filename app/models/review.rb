class Review < ApplicationRecord
  belongs_to :event, dependent: :destroy
end
