class User < ApplicationRecord
  has_many :communities
  has_many :subscribes, dependent: :destroy
  has_many :posts
  has_many :consumers, class_name: 'Communiy::Consumer'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_voter
end
