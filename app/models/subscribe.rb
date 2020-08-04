class Subscribe < ApplicationRecord
  belongs_to :user
  belongs_to :subscible, polymorphic: true

  validates :user_id, uniqueness: { scope: [:subscible_id, :subscible_type] }

  after_create :update_approve

  private

  def update_approve
    approve ||= !subscible.private?
  end
end
