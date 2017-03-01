class MarketsController < ApplicationController
  def create
    @market = Market.new(market_params)
    @farm = Farm.find(params[:market][:farm_id])
    @market.farms << @farm
    @market.save
    redirect_to :back
  end

  autocomplete :market, :name, :full => true, :extra_data => [:parsed_address]

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
