class CropsController < ApplicationController

  def index
    @farm = Farm.find params[:farm_id]
    @crops = Crop.where(farm_id: params[:farm_id])
    @new_crop = Crop.new

    @available_crops = @crops.where("harvest_date <= ?", Date.today).where(availability: true)
    @upcoming_crops = @crops.where(harvest_date: Date.tomorrow..2.weeks.from_now)
    @distant_crops = @crops.where("harvest_date > ?", 2.weeks.from_now)
    @past_crops = @crops.where("harvest_date <= ?", Date.today).where(availability: false)
  end

  def create
    @crop = Crop.new(crop_params)
    @crop.save!
    redirect_to :back
  end

  def show
    @crop = Crop.find(params[:id])
  end

  def update
    @crop = Crop.find(params[:id])
    @crop.update(crop_params)
  end

  def destroy
    @crop = Crop.find(params[:id])
    @crop.destroy
  end

  def search
    @crops = StockCrop.where("name ilike ?", "%#{params[:query]}%").take(10).to_json
    respond_to do |format|
      format.json { render :json => @crops}
    end
  end

  def crop_by_name
    @crop = StockCrop.where(name: params[:query]).first.to_json
    respond_to do |format|
      format.json { render :json => @crop }
    end
  end

  autocomplete :stock_crop, :name, :full => true, :extra_data => [:image_url]

  private

  def crop_params
    params.require(:crop).permit(
      :id,
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
