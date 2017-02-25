class CropsController < ApplicationController

  def index
    @farm = Farm.find params[:farm_id]
    @crops = Crop.where(farm_id: params[:farm_id])
    @new_crop = Crop.new
  end

  def create
    convert_date
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

  autocomplete :stock_crop, :name, :full => true, :extra_data => [:]

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

  def convert_date
    params[:harvest_date] = Date.strptime(params[:harvest_date], '%d/%m/%Y')
  end
end
