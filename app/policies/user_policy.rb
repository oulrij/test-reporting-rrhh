class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_manager?
        user.subordinates
      else
        scope.where(id: user.id)
      end
    end
  end

  def show?
    user.subordinates.include?(record) || user.id == record.id
  end

  def create?
    user.is_manager?
  end

  def update?
    user.is_manager?
  end
end
