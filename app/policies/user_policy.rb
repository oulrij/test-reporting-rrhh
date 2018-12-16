class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_manager?
        a = user.subordinates
        a << user
      else
        user
      end
    end
  end

  def show?
    true
  end

  def create?
    user.is_manager?
  end

  def update?
    user.is_manager?
  end
end
