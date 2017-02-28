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

  def update
  end

  def index
    @farms = Farm.all
  end

  def show
    @farm = Farm.find(params[:id])
    @crops = @farm.crops
  end

  private

    def farm_params
      params.require(:farm).permit(:name, :about_farm, :farmer, :profile_image, :banner_image, :user_id)
    end

end
