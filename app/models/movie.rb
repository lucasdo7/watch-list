class Movie < ApplicationRecord
  validates :title, :overview, :rating, presence: true
  validates :title, :overview, uniqueness: true
end
