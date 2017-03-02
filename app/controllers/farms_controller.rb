class FarmsController < ApplicationController

  def index
    @farms = Farm.all
  end

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    if @farm.save
      redirect_to farm_path(@farm)
    else
      redirect_to new_farm_path
    end
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

  def edit
    @farm = Farm.find(params[:id])
  end

  def update
    @farm = Farm.find(params[:id])
    if @farm.update(farm_params)
      redirect_to "/farms/#{@farm.id}"
    else
      redirect_to farm_path(@farm)
    end
  end

  def update_banner
    @farm = Farm.find(params[:farm_id])
    @farm.banner_image = params[:farm][:banner_image]
    if @farm.save
      redirect_to "/farms/#{@farm.id}"
    else
      redirect_to farm_path(@farm)
    end
  end

  def update_avatar
    @farm = Farm.find(params[:farm_id])
    @farm.profile_image = params[:farm][:profile_image]
    if @farm.save
      redirect_to "/farms/#{@farm.id}"
    else
      redirect_to farm_path(@farm)
    end
  end

  private

  def farm_params
    params.require(:farm).permit(:name, :about_farm, :farmer, :profile_image, :banner_image, :user_id, :address)
  end

end
