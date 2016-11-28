class PainsController < ApplicationController
  before_action :set_pain, only: [:show, :edit, :update, :destroy]

  def index
    @pains = Pain.all
  end

  def show
    @pain
  end

  def new
    @pain = Pain.new
  end

  def create
    @pain = Pain.new(pain_params)
    @pain.user = current_user
    if @pain.save
      redirect_to pains_path
    else
      render :new
    end
  end

  def edit
    @pain
  end

  def update
    @pain.update(pain_params)
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
end
