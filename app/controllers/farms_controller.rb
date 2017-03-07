class FarmsController < ApplicationController

  def index
    @farms = Farm.all
    @farm_results = []
    @market_results = []
  end
  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    @farm.save
    create_csa_boxes(@farm)
    current_user.update(farm_id: @farm.id)
    if @farm.save
      redirect_to farm_path(@farm)
    else
      redirect_to new_farm_path
    end
  end

  def create_csa_boxes(farm)
    small = Box.new ({
      farm_id: farm.id,
      size: 'small',
      price: params[:box][:small_price],
      description: params[:box][:small_description]
    })
    small.save
    medium = Box.new ({
      farm_id: farm.id,
      size: 'medium',
      price: params[:box][:medium_price],
      description: params[:box][:medium_description]
    })
    medium.save
    large = Box.new ({
      farm_id: farm.id,
      size: 'large',
      price: params[:box][:large_price],
      description: params[:box][:large_description]
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

  def search
    @query = params[:q]
    @location = Geokit::Geocoders::GoogleGeocoder.geocode(@query)
    @farm_results = Farm.within(params['farm_radius'], :origin => @location)
    @market_results = Market.within(params['farm_radius'], :origin => @location)
    render :action => :index
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
    params.require(:farm).permit(:name, :about_farm, :farmer, :profile_image, :banner_image, :user_id, :address, :small_price, :small_description, :medium_price, :medium_description, :large_price, :large_description, :currency)
  end

  # :csa_availability

end
