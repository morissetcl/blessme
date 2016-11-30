class PrayersController < ApplicationController

	def index
		set_pain
		@prayers = Prayer.all
		authorize @prayers
	end

	def new
		@pain = set_pain
		@prayer = Prayer.new
    authorize @prayer
	end

	def create
		@pain = set_pain
		@prayer = Prayer.new(prayer_params)

		Dir.mkdir(Rails.root.join('tmp')) if !Dir.exists?(Rails.root.join("tmp"))
		file_name = "#{SecureRandom::uuid}.wav"
		full_path = Rails.root.join("tmp", file_name)
		File.open(full_path, 'wb') { |file| file.write(URI::Data.new(params[:prayer][:audio]).data) }

		@prayer.audio = File.open(full_path, 'rb')

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


	def upload
    audio = params[:audio]
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
		@prayer.destroy
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
