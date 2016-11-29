class PrayersController < ApplicationController

	def new
		@pain = set_pain
		@prayer = Prayer.new
    authorize @prayer
	end

	def create
		@pain = set_pain
		@prayer = Prayer.new(prayer_params)
		@prayer.user = current_user
		@prayer.pain = @pain
    authorize @prayer
		 if @prayer.save
        respond_to do |format|
          format.html { redirect_to pain_path(@pain) }
          format.js
        end
    	else
      	flash.now[:alert] = "You didn't fill the form correctly"
      	render :new
    	end
	end

	def edit
		@pain = set_pain
		@prayer = set_prayer
    authorize @prayer
	end

	def update
		@pain = set_pain
		@prayer = set_prayer
		@prayer.update(prayer_params)
    authorize @prayer
		redirect_to pain_path(@pain)
	end

	def destroy
		@pain = set_pain
		@prayer = set_prayer
		if @prayer.destroy
      respond_to do |format|
        format.html { redirect_to pain_path(@pain) }
        format.js
      end
    end
    authorize @prayer
		redirect_to pain_path(@pain)
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
