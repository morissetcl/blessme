class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :team ]

  def home
    :skip_pundit
  end

  def team
    :skip_pundit
  end



end
