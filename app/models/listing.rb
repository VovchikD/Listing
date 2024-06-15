class Listing < ApplicationRecord
  belongs_to :user

  enum status: { pending: 0, rejected: 1, approved: 2 }

  has_one_attached :image

  validates :brand, :model, :price, :trip, :color, :fuel, :engine_capacity, :name, presence: true
end
