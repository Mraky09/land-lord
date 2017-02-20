class HousesController < ApplicationController
  def index
    @houses = House.all
    @hash = Gmaps4rails.build_markers(@houses) do |house, marker|
      marker.lat house.latitude
      marker.lng house.longitude
      marker.infowindow house.address
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
