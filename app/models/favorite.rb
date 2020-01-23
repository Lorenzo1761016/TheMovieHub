class Favorite < ApplicationRecord
  belongs_to :user
  validates :fav_id, presence: true
  validates :fav_type, presence: true
  validates :name, presence: true, uniqueness: true
end
