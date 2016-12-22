class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.where.not(latitude: nil, longitude: nil)
    authorize @users
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @prayer_as_writer = Prayer.where(user: @user)
    authorize @user
	end

  def create
    @user = User.new(params[:id])
    authorize @user
    if @user.save
      UserMailer.welcome(@user).deliver_now
    else
      render :new
    end
  end

	def edit
    authorize @user
	end

	def update
    authorize @user
		if !@user.update(user_params)
      render :edit

    else
      redirect_to user_path(@user)
    end
	end

	def destroy
		@user.delete
		authorize @user
		redirect_to  user_path(@user)
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :username, :email, :age, :country, :city, :biography, :religion, :language, :gender, :photo, :photo_cache )
	end

	def set_user
		@user = User.find(params[:id])
	end

end
