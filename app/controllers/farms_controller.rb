class FarmsController < ApplicationController

  def new
    farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    if @farm.save
      redirect_to "/farms/#{@farm.id}"
    else
      redirect_to '/farms#new'
    end
  end

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
        id: m.id,
        name: m.name,
        address: m.parsed_address,
        lat: m.lat,
        lng: m.lng
      }
    end
    market_data.to_json.html_safe
  end
  # respond_to? :html, :json
  def update
  @farm = Farm.find(params[:id])
  @farm.update_attributes(params[:farm])
  respond_with @farm
  end

  def upload_file

  responds_to_parent do
    render :update do |page|
      page.replace_html 'banner_image_upload', :partial => 'banner_image_uploadprofile_image_upload'
      @farm.profile_image = params[:uploaded_file]
    end
    render :update do |page|
      page.replace_html 'profile_image_upload', :partial => 'profile_image_upload'
      @farm.profile_image = params[:uploaded_file]
    end
  end
  end

  private

    def farm_params
      params.require(:farm).permit(:name, :about_farm, :farmer, :profile_image, :banner_image, :user_id)
    end

end
