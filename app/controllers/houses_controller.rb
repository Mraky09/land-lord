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
    # @citites = City.all
  end

  def show
  end

  def create
    @house = House.new house_params
    if @house.save
      redirect_to root_path
    end
  end

  private
  def house_params
    params.require(:house).permit(:title, :price, :description, :type, :status, :city_id, :no_bed_room, :no_bath_room, :area)
  end
end
