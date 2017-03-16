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
    boxes = create_csa_boxes(@farm)
    current_user.update(farm_id: @farm.id)
    if @farm.save
      redirect_to farm_crops_path(@farm)
    else
      redirect_to new_farm_path
    end
  end

  def currency_string_to_integer(currency_string)
    currency_string.gsub(',','').slice(2...-3)
  end

  def create_csa_boxes(farm)
    small = Box.new ({
      farm_id: farm.id,
      size: 'small',
      price: currency_string_to_integer(params[:box][:small_price]),
      description: params[:box][:small_description]
    })
    small.save
    medium = Box.new ({
      farm_id: farm.id,
      size: 'medium',
      price: currency_string_to_integer(params[:box][:medium_price]),
      description: params[:box][:medium_description]
    })
    medium.save
    large = Box.new ({
      farm_id: farm.id,
      size: 'large',
      price: currency_string_to_integer(params[:box][:large_price]),
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

def add_market
  new_market_geo_info = Geokit::Geocoders::GoogleGeocoder.geocode(params[:market][:market_address])
  @new_market = Market.new({
              name: params[:market_name],
              lat: new_market_geo_info.lat,
              lng: new_market_geo_info.lng,
              address: new_market_geo_info.formatted_address,
              parsed_address: new_market_geo_info.full_address,
              market_day: params[:market_day]
            })
  @new_market.save
# byebug
  @farm = Farm.find(params[:farm_id])
  @farm.markets << @new_market
    byebug
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

  def current_location
    address = Geokit::Geocoders::GoogleGeocoder.reverse_geocode(params[:latlng])
    respond_to do |format|
      format.json { render :json => address }
    end
  end

  def edit
    @farm = Farm.find(params[:id])
  end

  def update
    @farm = Farm.find(params[:id])
    byebug
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
    params.require(:farm).permit(:market_address, :market_day, :market_name, :name, :about_farm, :farmer, :profile_image, :banner_image, :csa_availability, :user_id, :address, :small_price, :small_description, :medium_price, :medium_description, :large_price, :large_description, :currency)
  end

end
