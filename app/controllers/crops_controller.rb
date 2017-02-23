class CropsController < ApplicationController
  def index
    @crops = Farm.find(param[:farm_id]).crops
  end

  def create
    @crop = Crop.new(crop_params)
  end

  def show
    @crops = Crop.find(param[:id])
  end

  def update
  end

  def destroy
    @crop = Crop.find(param[:id])
    @crop.destroy
    redirect_to farm_crops_path
  end

  private

  def crop_params
    params.require(:crop).permit(
      :farm_id,
      :name,
      :image,
      :description,
      :harvest_date,
      :availability
    )
  end
end
