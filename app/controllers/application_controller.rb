class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :get_current_user_notif
  before_action :set_coordinates

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
    if user_signed_in?
      @activities = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user.id)
      @notification = @activities.where(read: false)
      @notification_read = @activities.where(read: true)
    end
  end

  def set_coordinates
    @users = User.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end

