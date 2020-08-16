class PostPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    owner?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
