class AttractionsController < ApplicationController
  #before_action :require_login

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  def ride
    @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:id])
    flash[:ride_message] = @ride.take_ride
    redirect_to user_path(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

  def require_login
    flash[:message] = "You must be logged in to view the attractions!"
    redirect_to root_path
  end
end
