class PrayersController < ApplicationController
  before_action :set_prayer, only: [:edit, :update, :destroy, :upvote]
  before_action :set_pain, only: [:index, :create, :destroy, :edit, :update, :upvote]

  before_action :authenticate_user!
  include Pundit
 after_action :verify_authorized, except: [:upvote]

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
      respond_to do |format|
        format.html { redirect_to pain_path(@pain, anchor: 'prayer-id') }
        format.js { }
      end
    else
      flash.now[:alert] = "You didn't fill the form correctly"
      render :new
    end
  end


  def upvote
  @pain= Pain.find(params[:pain_id])
  @prayer = @pain.prayers.find(params[:id])

    if current_user.voted_for? @prayer
      current_user.unvote_for @prayer
      respond_to do |format|
        format.html { redirect_to pain_path(@pain) }
        format.js { }
      end
    else
      current_user.up_votes @prayer
      respond_to do |format|
        format.html { redirect_to pain_path(@pain) }
        format.js { }
      end
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
