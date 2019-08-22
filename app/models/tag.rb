class Tag < ApplicationRecord
  has_many :taggings
  has_many :plants, through: :taggings

  validates :name, presence: true, uniqueness: true
end
