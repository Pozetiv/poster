class Post < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: 'user_id'
  belongs_to :community, optional: true
  has_many :comments, as: :commentable

  validates :title, presence: true

  # scope :comments_count, -> { comments.}
  ##TODO write scope to count with inner comments elements
  acts_as_votable
end
