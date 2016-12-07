class PainPolicy < ApplicationPolicy
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

  def new?
    true
  end

  def create?
    true
  end

  def upvote?
    user
  end

  def report?
    user
  end

  def edit?
    record.user == user || user.admin?
  end

  def update?
    record.user == user || user.admin?
  end
end
