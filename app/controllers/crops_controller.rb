class CropsController < ApplicationController

  def index
    @farm = Farm.find params[:farm_id]
    @crops = Crop.where(farm_id: params[:farm_id])
    @new_crop = Crop.new
  end

  def create
    @crop = Crop.create!(crop_params)
  end

  def show
    @crops = Crop.find(params[:id])
  end

  def update
  end

  def destroy
    @crop = Crop.find(params[:id])
    @crop.destroy
    redirect_to farm_crops_path
  end

  autocomplete :stock_crop, :name, :full => true, :extra_data => [:image_url]

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
