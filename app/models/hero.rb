class Hero < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_one_attached :photo
end
