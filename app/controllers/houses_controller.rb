class HousesController < ApplicationController
  def index
    @houses = House.all
    @hash = Gmaps4rails.build_marker
  end
end
