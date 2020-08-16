class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :text, presence: true, length: { minimum: 2 }

  def count_comments
    count = comments.count
    comments.each { |comments| count += comments.count_comments }
    count
  end
end
