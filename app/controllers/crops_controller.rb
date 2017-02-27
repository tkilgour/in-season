class CropsController < ApplicationController

  def index
    @farm = Farm.find params[:farm_id]
    @crops = Crop.where(farm_id: params[:farm_id])
    @new_crop = Crop.new

    @available_crops = @crops.where(availability: true)
    @upcoming_crops = @crops.where(harvest_date: Date.today..2.weeks.from_now).where(availability: false)

    @distant_crops = @crops.where("harvest_date > 2.weeks.from_now").where(availability: false)

    @past_crops = @crops.where("harvest_date < Date.today").where(availability: false)
  end

  def create
    @crop = Crop.new(crop_params)
    @crop.save
  end

  def show
    @crop = Crop.find(params[:id])
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
      :default_image,
      :description,
      :harvest_date,
      :availability
    )

  end
end
