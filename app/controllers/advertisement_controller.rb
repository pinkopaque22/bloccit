class AdvertisementController < ApplicationController
  def index
     @advertisements = Advertisement.all
  end

  def show
  end

  def new
  end

  def create
  end
end
