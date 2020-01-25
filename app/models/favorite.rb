class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  validates :fav_id, presence: true
  validates :fav_type, presence: true
  validates :name, presence: true
  validates :user_id, presence: true
end
