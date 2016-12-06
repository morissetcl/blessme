class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def read_all_notification?
    true
  end

  def get_notif?
    true
  end


end
