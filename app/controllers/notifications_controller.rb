class NotificationsController < ApplicationController
  def read_all_notification
   PublicActivity::Activity.where(recipient_id: current_user.id).update_all(:read => true)
  end

  def get_notif
    @activities = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id) if current_user
    @notification_count = @activities.where(read: false).count if @activities
    return @notification_count
  end
end
