class MarketsController < ApplicationController
  def create
    @market = Market.new(market_params)
    @farm = Farm.find(params[:market][:farm_id])
    @market.farms << @farm
    @market.save
  end

  autocomplete :market, :name, :full => true, :extra_data => [:address]

  private 

  def market_params
    params.require(:market).permit(
      :id,
      :name,
      :address,
      :lat,
      :lng
    )
  end
end
