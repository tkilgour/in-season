class FarmsController < ApplicationController
  def index
    @farms = Farm.all
  end

  def show
    @farm = Farm.find(params[:id])
    @crops = @farm.crops
    @markets = @farm.markets
    @market_data = market_data(@markets)
    @new_market = @markets.new
  end

  def market_data(markets_array)
    market_data = []
    markets_array.each do |m|
      market_data << {
        name: m.name,
        address: m.parsed_address,
        lat: m.lat,
        lng: m.lng
      }
    end
    market_data.to_json.html_safe
  end
end
