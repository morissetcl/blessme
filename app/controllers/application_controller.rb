class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

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


  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end

