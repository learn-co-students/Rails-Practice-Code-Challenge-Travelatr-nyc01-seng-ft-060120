class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show]
  
  def index
    @destinations = Destination.all
  end
  
  def show
  end

  def new
    @destination = Destination.new(destination_params)
  end


  private
  def destination_params
    params.require(:destination).permit(:name, :country)
  end

  def set_destination
    @destination = Destination.find(params[:id])
  end
end
