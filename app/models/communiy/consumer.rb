class Communiy::Consumer < ApplicationRecord
  belongs_to :community
  belongs_to :user

  enum role: { writter: 0, moderator: 1 }

  validates  :user_id, uniqueness: { scope: :community_id }
end
