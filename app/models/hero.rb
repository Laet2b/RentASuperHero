class Hero < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  has_one_attached :photo
end
