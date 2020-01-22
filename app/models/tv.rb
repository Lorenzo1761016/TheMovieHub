class Tv < ApplicationRecord
    has_many :comments, as: :commentable
    validates :id, presence: true
end
