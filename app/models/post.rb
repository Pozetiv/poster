class Post < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: 'user_id'
  belongs_to :community, optional: true

  validates :title, presence: true
end
