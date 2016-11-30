class PrayersController < ApplicationController
  before_action :set_prayer, only: [:edit, :update, :destroy]
  before_action :set_pain

	def index
    @prayers = @pain.prayers
    authorize @prayers
  end

  def new
		@prayer = Prayer.new
    authorize @prayer
	end

	def create
		@prayer = Prayer.new(prayer_params)
		@prayer.user = current_user
		@prayer.pain = @pain
    authorize @prayer
		 if @prayer.save
        redirect_to pain_prayers_path(@pain)
    	else
      	flash.now[:alert] = "You didn't fill the form correctly"
      	render :new
    	end
	end

	def edit
    authorize @prayer
	end

	def update
		@prayer.update(prayer_params)
    authorize @prayer
		redirect_to pain_path(@pain)
	end

	def destroy
    @prayer.destroy
    authorize @prayer
		redirect_to pain_prayers_path(@pain)
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
