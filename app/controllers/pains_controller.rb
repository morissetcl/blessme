class PainsController < ApplicationController
  before_action :set_pain, only: [:edit, :update, :destroy, :upvote]

  def index
    @prayers = Prayer.all
    @pains = Pain.all
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
      flash.now[:alert] = "Pas encore de demande de prière pour cette catégorie"
      render "pains/index"
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
  end

  def upvote
    authorize @pain
     if current_user.voted_for? @pain
      current_user.unvote_for @pain
    else
      current_user.up_votes @pain
    end
  end

  private

  def set_pain
    @pain = Pain.find(params[:id])
  end

  def pain_params
    params.require(:pain).permit(:title, :description, :category, :thought_counter)
  end

  def pain_random
    @pain = Pain.where(category: params[:id]).sample
  end
end
