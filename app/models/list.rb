class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks
  has_many :avis

  validates :name, presence: true, uniqueness: true
end
