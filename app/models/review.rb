class Review < ApplicationRecord
  belongs_to :hero
  belongs_to :user

  validates :rating, inclusion: { in: (0..10),  message: "Your rating should be between 1 and 10" }
  validates :content, presence: true
end
