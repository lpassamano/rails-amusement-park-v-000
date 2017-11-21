class AttractionsController < ApplicationController
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

  end
end
