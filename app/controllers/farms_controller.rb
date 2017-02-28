class FarmsController < ApplicationController
  def index
    @farms = Farm.all
  end

  def show
    @farm = Farm.find(params[:id])
    @crops = @farm.crops
    @markets = @farm.markets

    @hash = Gmaps4rails.build_markers(@markets) do |market, marker|
      marker.lat market.lat
      marker.lng market.lng
    end
  end
end
