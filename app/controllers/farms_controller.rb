class FarmsController < ApplicationController

  def index
    @farms = Farm.all
  end

  def new
    @farm = Farm.new
  end


  def create
    @farm = Farm.new(farm_params)
    @farm.save
    create_csa_boxes(@farm)
    link_farm_to_user_in_users(@farm.id)
    if @farm.save
      redirect_to farm_path(@farm)
    else
      redirect_to new_farm_path
    end
  end

  def link_farm_to_user_in_users(farm_id)
    user = User.find(params[:user_id])
    user.update(farm_id: farm_id)
  end

  def create_csa_boxes(farm)
    # this is hard-coding ... TO DO :  when check_box marked, toggle forms for prices and descriptions
    small = Box.new ({
      farm_id: farm.id,
      size: 'small',
      pickup_price_cents: 35000,
      delivery_price_cents: 45000,
      description: 'Our small box feeds 2 people each week!'})
    small.save
    medium = Box.new ({
      farm_id: farm.id,
      size: 'medium',
      pickup_price_cents: 52500,
      delivery_price_cents: 62500,
      description: 'Our medium box feeds 4 people each week!'
    })
    medium.save
    large = Box.new ({
      farm_id: farm.id,
      size: 'large',
      pickup_price_cents: 70000,
      delivery_price_cents: 80000,
      description: 'Our large box feeds 6 people each week!'
    })
    large.save
  end

  def show
    @farm = Farm.find(params[:id])
    @crops = @farm.crops
    @markets = @farm.markets
    @market_data = market_data(@markets)
    @new_market = @markets.new
    @available_crops = @crops.where("harvest_date < ?", Date.today).where(availability: true)
  end

  def market_data(markets_array)
    market_data = []
    markets_array.each do |m|
      market_data << {
        id: m.id,
        name: m.name,
        address: m.parsed_address,
        market_day: m.market_day,
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
    params.require(:farm).permit(:name, :about_farm, :farmer, :profile_image, :banner_image, :user_id, :address, :csa_availability)
  end

end
