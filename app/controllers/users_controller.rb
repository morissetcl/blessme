class UsersController < ApplicationController

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
	 @user = set_user 
    authorize @user
	end

	def edit
		@user = set_user
    	authorize @user
	end

	def update
		@user = set_user
		@user.update!(user_params)
    	authorize @user
		redirect_to  user_path(@user)
	end

	def destroy
		@user = set_user
		@user.delete
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :username, :email, :age, :country, :city, :biography, :religion, :language, :gender, :photo, :photo_cache )
	end

	def set_user
		User.find(params[:id])
	end

<<<<<<< HEAD
	def set_pain
		Pain.find(params[:id])
	end

	def set_prayer
		Prayer.find(params[:id])
	end

=======
  # def set_coordinates
  #   @hash = Gmaps4rails.build_markers(@users) do |user, marker|
  #     marker.lat user.latitude
  #     marker.lng user.longitude
  #     # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
  #   end
  # end
>>>>>>> master
end
