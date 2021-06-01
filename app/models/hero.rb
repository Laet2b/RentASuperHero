class Hero < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
  has_one_attached :photo
end
