class FarmsController < ApplicationController

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    if @farm.save
      redirect_to "/farms/#{@farm.id}"
    else
      redirect_to farm_path(@farm)
    end
  end

  def index
    @farms = Farm.all
  end

  def show
    @farm = Farm.find(params[:id])
    @crops = @farm.crops
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
    byebug
    if @farm.save
      redirect_to "/farms/#{@farm.id}"
    else
      redirect_to farm_path(@farm)
    end
  end

  private

    def farm_params
      params.require(:farm).permit(:name, :about_farm, :farmer, :profile_image, :banner_image, :user_id)
    end

  end
