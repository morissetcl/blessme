class PrayersController < ApplicationController

	def new
		@pain = Pain.find(params[:pain_id])
		@prayer = Prayer.new
	end

	def create
		@pain = Pain.find(params[:pain_id])
		@prayer = Prayer.new(prayer_params)
		@prayer.user = current_user
		@prayer.pain = @pain
		 if @prayer.save
      	redirect_to pain_path(@pain)
    	else
      	flash.now[:alert] = "You didn't fill the form correctly"
      	render :new
    	end
	end

	def edit
		@pain = Pain.find(params[:pain_id])
		@prayer = Prayer.find(params[:id])
	end

	def update
		@pain = Pain.find(params[:pain_id])
		@prayer = Prayer.find(params[:prayer_id])
		@prayer.update(prayer_params)
		redirect_to pain_path(@pain)
	end

	def destroy
	end

	private

	def set_prayer
		@prayer = Prayer.find(params[:id])
	end

	def set_pain
		@pain = Pain.find(params[:pain_id])
	end

	def prayer_params
		params.require(:prayer).permit(:title, :description)
	end

end
