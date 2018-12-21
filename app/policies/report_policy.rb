class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_manager?
        a = user.subordinates.map & :reports
        a << user.reports
        a.flatten
      else
        user.reports
      end
    end
  end

  def show?
    user.subordinates.include?(record.user) || user.id == record.user_id
  end

  def create?
    user.is_manager?
  end

  def update?
    user.is_manager?
  end
end
