class PrayersController < ApplicationController

	def new
		@prayer = Prayer.new(params[:pain_id])
	end

	def create
		@prayer = Prayer.new(prayer_params)
		@pain = Pain.find(params[:pain_id])
		@prayer.pain = @pain
		@prayer.user == current_user
		 if @prayer.save
      	redirect_to pain_path(@pain)
    	else
      	flash.now[:alert] = "You didn't fill the form correctly"
      	render "pains/show"
    	end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def set_prayer
		
	end

	def prayer_params
		params.require(:prayer).permit(:title, :description)
	end

end
