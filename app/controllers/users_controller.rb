class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = set_user
	end

	def update
		@user = set_user
		@user.update!(user_params)
		redirect_to  user_path(@user)
	end

	def destroy
		@user = set_user
		@user.delete
	end

	private

	def user_params 
		params.require(:user).permit(:first_name, :last_name, :username, :email, :age, :country, :city, :biography, :religion, :language, :gender )
	end

	def set_user
		User.find(params[:id])
	end

end
