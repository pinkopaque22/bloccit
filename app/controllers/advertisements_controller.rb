class AdvertisementsController < ApplicationController
  def index
     @advertisements = Advertisement.all
  end

  def show
    @advertisements = Advertisement.find(params[:id])
  end

  def new
    @advertisements = Advertisement.new
  end

  def create
    @advertisements = Advertisement.new
    @advertisements.title = params[:advertisement][:title]
    @advertisements.copy = params[:advertisement][:copy]
    @advertisements.price = params[:advertisement][:price]
    
    if @advertisements.save
      flash[:notice] = "Your Advert has been saved."
      redirect_to @advertisements
    else
      flash[:error] = "Sorry, Please Try Again"
      render :new
    end
  end
end
