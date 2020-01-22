class Film < ApplicationRecord
    validates :id, presence: true
    has_many :comments, as: :commentable
end
