class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :get_current_user_notif

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :home, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :home, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  Pusher['test_channel'].trigger('greet', { :greeting => "Hello there!" })

  def user_not_authorized
   flash[:alert] = "You are not authorized to perform this action."
   redirect_to(root_path)
  end

  def get_current_user_notif
    @activities = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id) if current_user
    @notification = @activities.where(read: false) if @activities
    @notification_read = @activities.where(read: true) if @activities
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end

