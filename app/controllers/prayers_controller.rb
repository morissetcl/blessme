class PrayersController < ApplicationController
  before_action :set_prayer, only: [:edit, :update, :destroy]
  before_action :set_pain, only: [:index, :create, :destroy, :edit, :update]
  before_action :authenticate_user!

  def index
    set_pain
    @prayers = Prayer.all
    authorize @prayers
  end

  def new
  @prayer = Prayer.new
    authorize @prayer
  end

  def create
    @prayer = Prayer.new(prayer_params)
    @prayer.current_user = current_user

    if !params[:prayer][:audio].nil?
      Dir.mkdir(Rails.root.join('tmp')) if !Dir.exists?(Rails.root.join("tmp"))
      file_name = "#{SecureRandom::uuid}.wav"
      full_path = Rails.root.join("tmp", file_name)
      File.open(full_path, 'wb') { |file| file.write(URI::Data.new(params[:prayer][:audio]).data) }
      @prayer.audio = File.open(full_path, 'rb')
    end

    @prayer.user = current_user
    @prayer.pain = @pain
      authorize @prayer

   if @prayer.save
      @prayer.create_activity action: 'poke', recipient: @pain.user, parameters: {reason: 'You have a new prayer'}, :read => false
      redirect_to pain_path(@pain, anchor: 'prayer-id')
    else
      flash.now[:alert] = "You didn't fill the form correctly"
      render :new
    end
  end


  def upload
    audio = params[:audio]
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
    redirect_to pain_path(@pain)
  end

  def report_prayer
    @prayer = Prayer.find(params[:id])
    @prayer.report_prayer = true
    @prayer.save
    authorize @prayer
  end

  private

  def set_prayer
    @prayer = Prayer.find(params[:id])
  end

  def set_pain
    @pain = Pain.find(params[:pain_id])
  end

  def prayer_params
    params.require(:prayer).permit(:title, :description, :report_prayer)
  end

end
