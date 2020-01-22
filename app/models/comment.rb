class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true, optional: true
    has_many :comments, as: :commentable
    validates :body, presence: true
    validates :username, presence: true
    acts_as_votable
end
