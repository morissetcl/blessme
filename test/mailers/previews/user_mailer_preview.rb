class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.new
    UserMailer.welcome(user)
  end
end
