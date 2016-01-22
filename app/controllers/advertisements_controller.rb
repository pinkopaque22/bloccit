class AdvertisementsController < ApplicationController
  def index
     @advertisements = Advertisement.all
  end

  def show
    @advertisements = Advertisement.find(params[:id])
  end

  def new
  end

  def create
  end
end
