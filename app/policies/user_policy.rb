class UserPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    record == user
  end

  def update?
    record == user
  end
end
