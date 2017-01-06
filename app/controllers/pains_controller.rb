class PainsController < ApplicationController
  before_action :set_pain, only: [:edit, :update, :destroy, :upvote, :report, :pain_count]

  def index
    @prayers = Prayer.all
    @pains = Pain.all
    @pains_group = Pain.group(:category).count
    authorize @pains
  end

  def show
    # if params[:id] est inclu dans le tableau de categories then pain random
    # if params[:id] est un vrai id then set_pain

    if (Pain::CATEGORIES).include?(params[:id])
      pain_random
    else
      set_pain
    end
    if @pain.nil?
      redirect_to pains_path, :notice => "Pas encore de demande de prière pour cette catégorie"
    else
      authorize @pain
    end
    @prayer = Prayer.new
    authorize @prayer
  end

  def new
    @pain = Pain.new
    authorize @pain
  end

  def create
    @pain = Pain.new(pain_params)
    @pain.user = current_user
    authorize @pain

    if @pain.save
      redirect_to pain_path(@pain)
    else
      render :new
    end
  end

  def edit
    @pain
    authorize @pain
  end

  def update
    @pain.update(pain_params)
    authorize @pain
    redirect_to pain_path(@pain)
  end

  def destroy
    @pain.delete
    redirect_to pains_path
    authorize @pain
  end

  def upvote
    authorize @pain
    if current_user.voted_for? @pain
      raise

      current_user.unvote_for @pain
    else
      current_user.up_votes @pain
    end
  end

  def report
    @pain.report = true
    @pain.save
    authorize @pain
  end

  private

  def set_pain
    @pain = Pain.find(params[:id])
  end

  def pain_params
    params.require(:pain).permit(:title, :description, :category, :thought_counter, :report)
  end

  def pain_random
    @pain = Pain.where(category: params[:id]).sample
  end
end
