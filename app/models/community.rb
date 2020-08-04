class Community < ApplicationRecord
  extend FriendlyId

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :posts, dependent: :destroy
  has_many :subscribes, as: :subscible, dependent: :destroy
  has_many :users, as: :subscribses

  has_one_attached :logo
  CATEGORY = %w[Sport Game News Internet Other]

  validates :title, :description, presence: true
  validates :category, inclusion: { in: Community::CATEGORY }

  friendly_id :title, use: :slugged

  alias_attribute :private?, :private
end