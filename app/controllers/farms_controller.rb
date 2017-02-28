class FarmsController < ApplicationController

  def create

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
