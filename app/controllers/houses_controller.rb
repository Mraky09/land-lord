class HousesController < ApplicationController
  def index
    @houses = House.all

    @hash = Gmaps4rails.build_markers(@houses) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.address
    end
  end

  def new
    @house = House.new
  end

  def show
  end

  def create
    @house = House.create house_params

    @house.save
  end

  private
  def house_params
    params.require(:house).permit(:address)
  end
end
