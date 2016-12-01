class PainsController < ApplicationController
  before_action :set_pain, only: [:edit, :update, :destroy]

  def index
    @prayers = Prayer.all
    @pains = Pain.all
    authorize @pains
  end

  def show
    pain_random

    @prayer = Prayer.new
    authorize @pain

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

  private

  def set_pain
    @pain = Pain.find(params[:id])
  end

  def pain_params
    params.require(:pain).permit(:title, :description, :category)
  end

  def pain_random
    random = []
    @pains= Pain.last(50)
    @pain= @pains.sample
  end
end
