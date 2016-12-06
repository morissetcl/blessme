class NotificationsController < ApplicationController
  skip_after_action :verify_authorized

  def read_all_notification
   PublicActivity::Activity.where(recipient_id: current_user.id).update_all(:read => true)
  end

  def get_notif
    respond_to do |format|
      format.js do
        @activities = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id) if current_user
        @notification = @activities.where(read: false) if @activities
      end
    end
  end
end
